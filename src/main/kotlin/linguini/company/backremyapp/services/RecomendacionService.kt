package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.ObjetivoUsuario
import linguini.company.backremyapp.domain.PerfilEconomico
import linguini.company.backremyapp.domain.PrecioIngrediente
import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.RecomendacionRecetaDTO
import linguini.company.backremyapp.dto.RecomendacionRequest
import linguini.company.backremyapp.dto.SugerenciaDiariaDTO
import linguini.company.backremyapp.helpers.RecetaMapper
import linguini.company.backremyapp.repositories.FavoritoRecetaRepository
import linguini.company.backremyapp.repositories.HistorialRecetaRepository
import linguini.company.backremyapp.repositories.PrecioIngredienteRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import linguini.company.backremyapp.exceptions.NotFoundException
import org.springframework.data.domain.PageRequest
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import kotlin.math.roundToInt
import java.util.UUID
import kotlin.math.cos

@Service
class RecomendacionService(
    private val usuarioRepository: UsuarioRepository,
    private val recetaRepository: RecetaRepository,
    private val precioIngredienteRepository: PrecioIngredienteRepository,
    private val favoritoRecetaRepository: FavoritoRecetaRepository,
    private val historialRecetaRepository: HistorialRecetaRepository,
    private val recetaMapper: RecetaMapper
) {
    @Transactional(readOnly = true)
    fun recomendarRecetas(usuarioId: UUID, req: RecomendacionRequest): List<RecomendacionRecetaDTO> {
        val usuario = usuarioRepository.findPerfilById(usuarioId)
            .orElseThrow { NotFoundException("Usuario no encontrado") }

        val limiteNormalizado = req.limite.coerceIn(1, 50)

        // se buscan los ing disponibles tanto en el input como en la lista comun del user
        val ingredientesDisponibles = (
                req.ingredientesExtra.map { it.trim().lowercase() } +
                usuario.ingredientesComunes().map { it.nombre.lowercase() }
            ).distinct()
        val ingredinetesAEvitar = usuario.ingredientesAEvitar().map { it.nombre.lowercase() }

        // flag para determinar si se usan ing comunes o tambien del input
        val busquedaActiva = req.ingredientesExtra.isNotEmpty()

        // restricciones, se resuelve en el service con los id q pesan menos y se pasan a la query
        val restriccionesIds = usuario.restriccionesAlimentarias.mapNotNull { it.id }.ifEmpty { null }

        val recetas = buscarCandidatas(usuario, ingredientesDisponibles, ingredinetesAEvitar, restriccionesIds,
            req.tiempoMaximo, req.puedeComprar, busquedaActiva, limiteNormalizado)

        if (recetas.isEmpty()) return  emptyList()

        val preciosPorIngredienteId = buscarPreciosPorIngrediente(recetas)

        val favoritosIds = favoritoRecetaRepository.findRecetaIdsByUsuarioId(usuarioId)
        val historialIds = historialRecetaRepository.findRecetasByUsuarioId(usuarioId)
            .mapNotNull { it.id }
            .toSet()

        // mapea de una vez todas las recetas y las asocia a un id, mas eficaz q meter el mapeo dentro de un loop
        val recetasResumenMap = recetaMapper.toRecetaResumenDTO(recetas, favoritosIds).associateBy { it.id }

        return recetas
            .map { receta ->
                val costoAproximado = receta.costoTotalCompra
                val evaluacion = evaluarReceta(
                    receta, usuario, ingredientesDisponibles, req.ingredientesExtra,
                    favoritosIds, historialIds, costoAproximado, req.puedeComprar, busquedaActiva
                )
                RecomendacionRecetaDTO(
                    receta = recetasResumenMap[receta.id]!!,
                    puntaje = evaluacion.puntaje,
                    costoAproximado = costoAproximado,
                    motivosPositivos = evaluacion.motivosPositivos,
                    motivosNegativos = evaluacion.motivosNegativos,
                    ingredientesCoincidentes = receta.ingredientesCoincidentesCon(usuario).map { it.nombre }.toSet(),
                    ingredientesFaltantes = receta.ingredientesFaltantesPara(usuario).map { it.nombre }.toSet()
                )
            }
            .sortedWith(compareByDescending<RecomendacionRecetaDTO> { it.puntaje }.thenBy { it.receta.tiempoEnMinutos })
            .take(limiteNormalizado)
    }

    @Transactional(readOnly = true)
    fun sugerenciaDiaria(usuarioId: UUID): SugerenciaDiariaDTO {
        val usuario = usuarioRepository.findPerfilById(usuarioId).orElseThrow { NotFoundException("Usuario no encontrado") }

        val ingredientesDisponibles = usuario.ingredientesComunes().map { it.nombre.lowercase() }
        val ingredientesAEvitar = usuario.ingredientesAEvitar().map { it.nombre.lowercase() }
        val restriccionesIds = usuario.restriccionesAlimentarias.mapNotNull { it.id }.ifEmpty { null }

        val recetas = buscarCandidatas(
            usuario, ingredientesDisponibles, ingredientesAEvitar, restriccionesIds,
            null, true, false, LIMITE_SUGERENCIA_DIARIA
        )

        // deberia traer una cualquiera y en el front sugerir que ajuste su perfil ?
        if(recetas.isEmpty()) throw NotFoundException("No hay recetas disponibles para tu perfil")

        val favoritosIds = favoritoRecetaRepository.findRecetaIdsByUsuarioId(usuarioId)
        val historialIds = historialRecetaRepository.findRecetasByUsuarioId(usuarioId)
            .mapNotNull { it.id }.toSet()
        val preciosPorIngredienteId = buscarPreciosPorIngrediente(recetas)

        // Se puntúan todas, se toman las TOP_N mejor rankeadas y se elige una al azar entre ellas.
        // Así la sugerencia varía en cada visita pero siempre es una receta relevante.
        val candidatasTop = recetas
            .map { receta ->
                val costo = receta.costoTotalCompra
                val evaluacion = evaluarReceta(
                    receta, usuario, ingredientesDisponibles, emptyList(),
                    favoritosIds, historialIds, costo, puedeComprar = true, busquedaActiva = false
                )
                Pair(receta, evaluacion)
            }
            .sortedByDescending { (_, eval) -> eval.puntaje }
            .take(TOP_SUGERENCIAS_RANDOM)

        val (recetaElegida, evaluacion) = candidatasTop.random()

        val resumen = recetaMapper.toRecetaResumenDTO(listOf(recetaElegida), favoritosIds).first()

        return SugerenciaDiariaDTO(
            receta = resumen,
            motivosPositivos = evaluacion.motivosPositivos
        )
    }

    private fun buscarCandidatas(
        usuario: Usuario, ingredientesDisponibles: List<String>, ingredientesAEvitar: List<String>,
        restriccionesIds: List<Long>?, tiempoMaximo: Int?, puedeComprar: Boolean, busquedaActiva: Boolean, limite: Int
    ): List<Receta> {
        val cantidadCandidatas = (limite * MULTIPLICADOR_CANDIDATAS).coerceAtLeast(MINIMO_CANDIDATAS)
        val pageable = PageRequest.of(0, cantidadCandidatas)

        // busqueda de las recetas teniendo en cuenta: tiempo, ing a evitar y comun (preferencias del user)
        // la query ordena por coincidencia con los ing dispo, pero el sist de scrore refina el orden
        val recetas: List<Receta> =
            if (busquedaActiva) {  //o sea si el user ingreso ing en el input o solo quiere recetas con los ing que marco como comun
                // si puede comprar la busqueda de recetas se amplia, basta con que tenga algunos de los ing dispo en cualquiera de las 3 listas
                if (puedeComprar) {
                    recetaRepository.findConAlgunIngrediente(
                        ingredientesDisponibles,
                        tiempoMaximo,
                        ingredientesAEvitar,
                        restriccionesIds,
                        pageable
                    )
                } else { // si no puede comprar la busqueda se limita a recetas que tenga todos los ing disponibles
                    // SUGERENCIAS: devuelve recetas con ingredientes core, max 2 reemplazables faltantes y pueden faltar opcionales
                    // filtra ingredientes a evitar en las 3 listas y restricciones
                    recetaRepository.findConTodosLosIngredientes(
                        ingredientesDisponibles,
                        tiempoMaximo,
                        ingredientesAEvitar,
                        restriccionesIds,
                        pageable
                    )
                }
            } else { // si no tiene ingredinetes extra en el input, la busqueda se ajusta solo a las preferencias del user
                val ingredientesComunesIds = idsParaQuery(usuario.ingredientesComunes().mapNotNull { it.id })
                val ingredientesAEvitarIds = idsParaQuery(usuario.ingredientesAEvitar().mapNotNull { it.id })

                // SUGERENCIAS: ingredientesCore disponibles, hasta 5 reemplazables faltantes e ignora opcionales
                val candidatasIds = recetaRepository.findIdsCandidatasParaRecomendacion(
                    ingredientesComunesIds = ingredientesComunesIds,
                    ingredientesAEvitarIds = ingredientesAEvitarIds,
                    restriccionesIds = restriccionesIds,
                    tiempoMaximo = tiempoMaximo,
                    pageable = pageable
                )

                if (candidatasIds.isEmpty()) return emptyList()

                val ordenPorId = candidatasIds.withIndex().associate { it.value to it.index }

                recetaRepository.findAllWithDetailsByIdIn(candidatasIds)
                    .sortedBy { receta -> ordenPorId[receta.id] ?: Int.MAX_VALUE }
            }

        // TODO: este filtro es bastante chico por eso no me parece mal dejarlo aca, pero quizas se deberia hacer tambien en el repo
        return if (!puedeComprar && !busquedaActiva) {
            recetas.filter { receta -> tieneIngredientesDisponiblesParaSugerencia(receta, ingredientesDisponibles) }
        } else {
            recetas
        }
    }

    private fun tieneIngredientesDisponiblesParaSugerencia(
        receta: Receta,
        ingredientesDisponibles: List<String>
    ): Boolean {
        val disponibles = ingredientesDisponibles.toSet()
        val tieneTodosLosCore = receta.ingredientesCore.all {
            it.ingrediente.nombre.lowercase() in disponibles
        }
        val reemplazablesFaltantes = receta.ingredientesReemplazables.count {
            it.ingrediente.nombre.lowercase() !in disponibles
        }

        return tieneTodosLosCore && reemplazablesFaltantes <= 5
    }

    private fun idsParaQuery(ids: List<Long>): List<Long> {
        return ids.ifEmpty { listOf(ID_INEXISTENTE) }
    }

    private fun buscarPreciosPorIngrediente(recetas: List<Receta>): Map<Long, PrecioIngrediente> {
        val ingredientesIds = recetas
            .flatMap { receta -> receta.ingredientes.mapNotNull { it.ingrediente.id } }
            .distinct()

        if (ingredientesIds.isEmpty()) return emptyMap()

        return precioIngredienteRepository.findByIngredienteIdIn(ingredientesIds)
            .mapNotNull { precio -> precio.ingrediente.id?.let { it to precio } }
            .toMap()
    }

//    private fun costoAproximado(
//        receta: Receta,
//        preciosPorIngredienteId: Map<Long, PrecioIngrediente>
//    ): Double {
//        val costo = receta.ingredientes.sumOf { recetaIngrediente ->
//            val ingredienteId = recetaIngrediente.ingrediente.id ?: return@sumOf 0.0
//            val precio = preciosPorIngredienteId[ingredienteId] ?: return@sumOf 0.0
//
//            recetaIngrediente.costoEstimado(precio)
//        }
//
//        return (costo * 100).roundToInt() / 100.0
//    }

    /* Evaluar receta solamente agrega un puntaje y un array de motivos
    De esta manera podemos ofrecerle al usuario un scoring en base a su configuración
    Y la explicación de por qué a través de los motivos */
    private fun evaluarReceta(
        receta: Receta,
        usuario: Usuario,
        ingredientesDisponibles: List<String>,
        ingredientesExtra: List<String>,
        favoritosIds: Set<Long>,
        historialIds: Set<Long>,
        costoAproximado: Double,
        puedeComprar: Boolean,
        busquedaActiva: Boolean
    ): EvaluacionRecomendacion {
        var puntaje = 0
        val motivosPositivos = mutableListOf<String>()
        val motivosNegativos = mutableListOf<String>()

//        val coincidencias = receta.ingredientesCoincidentesCon(usuario)
//        val faltantes = receta.ingredientesFaltantesPara(usuario)
        val ingredientesAEvitar = ingredientesAEvitarPresentes(receta, usuario)
        val compatibleConObjetivo = receta.esCompatibleConObjetivo(usuario.objetivo)
        val cumpleRestricciones = receta.cumpleRestricciones(usuario.restriccionesAlimentarias)

        val disponiblesSet = ingredientesDisponibles.toSet() // para buscar mas rapido y evitar duplicados en los strings
        val ingredientesReceta = receta.ingredientes
        val totalIngredientes = ingredientesReceta.size

        // se comparan los ing contra los ingredinetes totales (perfil del user y req)
        val nombresReceta = ingredientesReceta.map { it.ingrediente.nombre.lowercase() }
        val coincidenciasTotales = nombresReceta.count { it in disponiblesSet }
        val coincidenciasRequest = ingredientesExtra.count { it in nombresReceta }
        val faltantes = totalIngredientes - coincidenciasTotales

        // se aplica un peso al puntaje "base"
        val peso = if (busquedaActiva) PESO_INGREDIENTES_BUSQUEDA else PESO_INGREDIENTES_PERFIL
        puntaje += puntosPorIngredientes(
            coincidenciasTotales, totalIngredientes, faltantes, usuario.perfilEconomico, puedeComprar, peso
        )

        if (coincidenciasTotales > 0) {
            val detalleRequest = if (busquedaActiva && coincidenciasRequest > 0)
                " ($coincidenciasRequest de los que buscaste)" else ""
            motivosPositivos.add("Tiene $coincidenciasTotales/$totalIngredientes ingredientes disponibles$detalleRequest")
        }
        when {
            faltantes > 0 && !puedeComprar ->
                motivosNegativos.add("Faltan $faltantes ingrediente(s) que no podés comprar")
            faltantes > 0 ->
                motivosNegativos.add("Necesitás comprar $faltantes ingrediente(s)")
            totalIngredientes > 0 -> {
                puntaje += PUNTOS_EXTRA_DESPENSA_COMPLETA
                motivosPositivos.add("Tenés todos los ingredientes")
            }
        }

//        if (coincidencias.isNotEmpty()) {
//            puntaje += puntosPorIngredientes(coincidencias.size, totalIngredientes, faltantes.size, usuario.perfilEconomico)
//            motivos.add("Usa ${coincidencias.size} ingrediente(s) comun(es) del usuario")
//        }
//        if (faltantes.isEmpty() && receta.ingredientes.isNotEmpty()) {
//            puntaje += PUNTOS_EXTRA_DESPENSA_COMPLETA
//            motivos.add("El usuario ya tiene todos los ingredientes principales cargados como comunes")
//        }

        // restricciones del user
        if (cumpleRestricciones) {
            puntaje += PUNTOS_RESTRICCIONES
            motivosPositivos.add("Cumple tus restricciones alimentarias")
        } else {
            val restriccionesIncumplidas = restriccionesIncumplidas(receta, usuario)
            motivosNegativos.add("Requiere adaptar ingredientes para cumplir: ${restriccionesIncumplidas.joinToString(", ")}")
        }

        // objetivos del user
        if (compatibleConObjetivo) {
            puntaje += puntosPorObjetivo(usuario.objetivo)
            if (usuario.objetivo != ObjetivoUsuario.INDIFERENTE) motivosPositivos.add("Acompaña tu objetivo actual")
        } else {
            motivosNegativos.add("No acompaña del todo tu objetivo: ${usuario.objetivo.label}")
        }

        // dificultad
        val diferenciaDificultad = receta.dificultad.ordinal - usuario.nivelCocina.ordinal
        if (diferenciaDificultad <= 0) {
            puntaje += PUNTOS_DIFICULTAD
            motivosPositivos.add("La dificultad es adecuada para tu nivel")
        } else {
            puntaje += (PUNTOS_DIFICULTAD - diferenciaDificultad * PENALIZACION_DIFICULTAD).coerceAtLeast(0)
            motivosNegativos.add("Puede ser mas dificil que tu nivel de cocina actual")
        }


        // si contiene o no ing a evitar
        if (!receta.contieneIngredienteAEvitar(usuario)) {
            puntaje += PUNTOS_SIN_INGREDIENTES_A_EVITAR
        } else {
            motivosNegativos.add("Contiene ingrediente(s) que preferis evitar: ${ingredientesAEvitar.joinToString(", ")}")
        }

        // costo
        puntaje += puntosPorCosto(costoAproximado, usuario.perfilEconomico)
        motivoCosto(costoAproximado, usuario.perfilEconomico, motivosPositivos, motivosNegativos)

        // modificadores de historial y fav
        if (receta.id?.let { it in favoritosIds } == true) {
            puntaje += MODIFICADOR_FAVORITO
            motivosPositivos.add("Ya esta marcada como favorita")
        }

        if (receta.id?.let { it in historialIds } == true) {
            puntaje -= MODIFICADOR_HISTORIAL
            motivosNegativos.add("Ya fue cocinada recientemente")
        }

        // tiempo
        val puntosTiempo= puntosPorTiempo(receta.tiempoEnMinutos)
        puntaje += puntosTiempo
        if (puntosTiempo == PUNTOS_TIEMPO_RAPIDO)
            motivosPositivos.add("Receta rápida (${receta.tiempoEnMinutos} min)")

        // puntaje normalizado y motivos finales
        val puntajeNormalizado = ((puntaje.toDouble() / MAX_SCORE_TEORICO) * 100).roundToInt().coerceIn(0, 100)

        return EvaluacionRecomendacion(puntajeNormalizado, motivosPositivos, motivosNegativos)
    }

    private fun puntosPorIngredientes(
        coincidencias: Int,
        totalIngredientes: Int,
        faltantes: Int,
        perfilEconomico: PerfilEconomico,
        puedeComprar: Boolean,
        peso: Double // se agrega valor a si hay ingredinetes en el input de busqueda o no
    ): Int {
        if (totalIngredientes == 0) return 0

        // se aplica tambien el valor del peso
        val puntosBase = ((coincidencias.toDouble() / totalIngredientes) * PUNTOS_INGREDIENTES * peso).roundToInt()

        val penalizacion = if (puedeComprar) {
            when (perfilEconomico) {
                PerfilEconomico.BAJO_PRESUPUESTO -> faltantes * 2
                PerfilEconomico.INTERMEDIO -> faltantes
                PerfilEconomico.FLEXIBLE -> 0
            }
        } else {
            when (perfilEconomico) {
                PerfilEconomico.BAJO_PRESUPUESTO -> faltantes * 4
                PerfilEconomico.INTERMEDIO -> faltantes * 3
                PerfilEconomico.FLEXIBLE -> faltantes * 2
            }
        }

        return (puntosBase - penalizacion).coerceIn(0, PUNTOS_INGREDIENTES)
    }

    private fun puntosPorCosto(costoAproximado: Double, perfilEconomico: PerfilEconomico): Int {
        return when (perfilEconomico) {
            PerfilEconomico.BAJO_PRESUPUESTO -> when {
                costoAproximado <= 1500.0 -> PUNTOS_COSTO
                costoAproximado <= 2500.0 -> 6
                costoAproximado <= 4000.0 -> 2
                else -> 0
            }
            PerfilEconomico.INTERMEDIO -> when {
                costoAproximado <= 2500.0 -> PUNTOS_COSTO
                costoAproximado <= 4500.0 -> 6
                costoAproximado <= 6500.0 -> 3
                else -> 0
            }
            PerfilEconomico.FLEXIBLE -> when {
                costoAproximado <= 5000.0 -> PUNTOS_COSTO
                costoAproximado <= 8000.0 -> 6
                else -> 3
            }
        }
    }

    private fun motivoCosto(costoAproximado: Double, perfilEconomico: PerfilEconomico, motivosPositivos: MutableList<String>, motivosNegativos: MutableList<String>) {
        val costo = "${'$'}${costoAproximado.roundToInt()}"

        when (perfilEconomico) {
            PerfilEconomico.BAJO_PRESUPUESTO -> when {
                costoAproximado <= 1500.0 -> motivosPositivos.add("Costo accesible para tu presupuesto ($costo)")
                costoAproximado <= 2500.0 -> motivosPositivos.add("Costo ajustado a tu presupuesto ($costo)")
                else -> motivosNegativos.add("Costo elevado para tu presupuesto ($costo)")
            }
            PerfilEconomico.INTERMEDIO -> when {
                costoAproximado <= 2500.0 -> motivosPositivos.add("Buen costo para tu perfil ($costo)")
                costoAproximado <= 4500.0 -> motivosPositivos.add("Costo moderado para tu perfil ($costo)")
                else -> motivosNegativos.add("Costo elevado para tu perfil ($costo)")
            }
            PerfilEconomico.FLEXIBLE -> when {
                costoAproximado <= 5000.0 -> motivosPositivos.add("Costo dentro de tu rango ($costo)")
                else -> motivosNegativos.add("Costo por encima de tu rango habitual ($costo)")
            }
        }
    }

    private fun restriccionesIncumplidas(receta: Receta, usuario: Usuario): List<String> {
        return usuario.restriccionesAlimentarias
            .filterNot { restriccion ->
                receta.ingredientes.all { recetaIngrediente ->
                    recetaIngrediente.ingrediente.cumpleRestriccion(restriccion)
                }
            }
            .map { it.nombre }
    }

    private fun ingredientesAEvitarPresentes(receta: Receta, usuario: Usuario): List<String> {
        val ingredientesAEvitarIds = usuario.ingredientesAEvitar()
            .mapNotNull { it.id }
            .toSet()

        if (ingredientesAEvitarIds.isEmpty()) return emptyList()

        return receta.ingredientes
            .map { it.ingrediente }
            .filter { it.id in ingredientesAEvitarIds }
            .map { it.nombre }
            .distinct()
    }

    private fun puntosPorObjetivo(objetivo: ObjetivoUsuario): Int {
        /* Suma puntos basándonos en el objetivo */
        return when (objetivo) {
            ObjetivoUsuario.INDIFERENTE -> 5
            ObjetivoUsuario.COMER_SALUDABLE -> PUNTOS_OBJETIVO
            ObjetivoUsuario.BAJAR_PESO -> PUNTOS_OBJETIVO
            ObjetivoUsuario.GANAR_MASA_MUSCULAR -> PUNTOS_OBJETIVO
        }
    }

    private fun puntosPorTiempo(tiempoEnMinutos: Int): Int {
        /* Esto solo toma en cuenta el tiempo de la receta,
        si tarda 20 o menos, 10 puntos
        Si tarda 45 o menos, 5, si no 0*/
        return when {
            tiempoEnMinutos <= 20 -> 5
            tiempoEnMinutos <= 45 -> 3
            else -> 0
        }
    }

    private companion object {
        const val ID_INEXISTENTE = -1L
        const val MULTIPLICADOR_CANDIDATAS = 5
        const val MINIMO_CANDIDATAS = 50
        const val LIMITE_SUGERENCIA_DIARIA = 30
        const val TOP_SUGERENCIAS_RANDOM = 5

        const val PUNTOS_INGREDIENTES = 30
        const val PUNTOS_RESTRICCIONES = 20
        const val PUNTOS_OBJETIVO = 15
        const val PUNTOS_DIFICULTAD = 15
        const val PUNTOS_SIN_INGREDIENTES_A_EVITAR = 10
        const val PUNTOS_COSTO = 10

        const val PUNTOS_EXTRA_DESPENSA_COMPLETA = 5
        const val PENALIZACION_DIFICULTAD = 5
        const val MODIFICADOR_FAVORITO = 5
        const val MODIFICADOR_HISTORIAL = 5
        const val PUNTOS_TIEMPO_RAPIDO = 3

        /* con el peso determino que si el user no ingreso ningun ing por input y solo usa los ing comunes declarados en su perfil
        entonces vale mas sus preferencias como objetivo, restriccion o dificultad,
        en cambio, si ingresa ing en el input de busqueda entonces los ingredientes tienen mas peso porque la busqueda se basa en los ing
        por ej: una receta con 5 ing y el user tiene 4
        ing en busqueda (peso: 1.2): 4 / 5  * 30 (puntos_ing) * 1.2 -> 29 pts
        ing comunes, perfil (peso: 0.8): 4 / 5 * 30 * 0.8 -> 19 pts
        el objetivo es que si el user se tomo el trabajo de ingresar ings en la busqueda entonces deberia tener mas importancia en el resultado
         */
        const val PESO_INGREDIENTES_BUSQUEDA = 1.2
        const val PESO_INGREDIENTES_PERFIL = 0.8

        /* máximo teórico para normalizar correctamente el score = 118, es la suma total de los puntos de una receta perfecta
           30  ingredientes (coincidencia 100% con peso 1.0, 0 faltantes, 0 penalización)
            5  bonus despensa completa
           20  restricciones cumplidas
           20  objetivo activo cumplido (COMER_SALUDABLE / BAJAR_PESO / GANAR_MASA_MUSCULAR)
           15  dificultad adecuada
           10  sin ingredientes a evitar
           10  costo ideal para el perfil
            3  receta rápida (≤20 min)
            5  está en favoritos
           ───
           118 (si el objetivo es INDIFERENTE entonces el total seria = 103, detallesssss)

       entonces con esa vara es convertir despues en un puntaje de 0 a 100 sin forzarlo
       en caso de que hayan dos recetas "buenas" no se colapsan ambas con 100 sino que hay un discriminador "real"
       ejemplo:
       receta 1: con 89 puntos -> (89/118) * 100 = 75
       receta 2: con 85 puntos -> (85/118) * 100 = 72
         */
        const val MAX_SCORE_TEORICO = 118
    }
}

private data class EvaluacionRecomendacion(
    val puntaje: Int,
    val motivosPositivos: List<String>,
    val motivosNegativos: List<String>
)
