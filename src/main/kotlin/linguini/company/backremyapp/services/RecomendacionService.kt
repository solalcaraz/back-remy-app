package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.ObjetivoUsuario
import linguini.company.backremyapp.domain.PerfilEconomico
import linguini.company.backremyapp.domain.PrecioIngrediente
import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.RecomendacionRecetaDTO
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

@Service
class RecomendacionService(
    private val usuarioRepository: UsuarioRepository,
    private val recetaRepository: RecetaRepository,
    private val precioIngredienteRepository: PrecioIngredienteRepository,
    private val favoritoRecetaRepository: FavoritoRecetaRepository,
    private val historialRecetaRepository: HistorialRecetaRepository,
    private val recetaMapper: RecetaMapper
) {
    /* Así encaró el tema de la recomendación codex, no está teniendo en cuenta los inputs del home porque no sabe
    el contexto del front salvo el de mi vista, agregale la logica de tus inputs y condimentalo como vos quieras @Sol */
    /* Lo de devolver el objeto con puntaje y lista de badges me pareció genial, pero esta hecho con zaraza creo */
    /* No sé cómo va a ser llevar esto a SQL, veamos si es facil si no lo dejamos asi chupando todas las recetas */
    @Transactional(readOnly = true)
    fun recomendarRecetas(usuarioId: UUID, limite: Int = 10): List<RecomendacionRecetaDTO> {
        val usuario = usuarioRepository.findPerfilById(usuarioId)
            .orElseThrow { NotFoundException("Usuario no encontrado") }

        val limiteNormalizado = limite.coerceIn(1, 50)

        val recetas = buscarCandidatas(usuario, limiteNormalizado)
        val preciosPorIngredienteId = buscarPreciosPorIngrediente(recetas)

        val favoritosIds = favoritoRecetaRepository.findRecetaIdsByUsuarioId(usuarioId)
        val historialIds = historialRecetaRepository.findRecetasByUsuarioId(usuarioId)
            .mapNotNull { it.id }
            .toSet()

        return recetas
            .map { receta ->
                val costoAproximado = costoAproximado(receta, preciosPorIngredienteId)
                val evaluacion = evaluarReceta(receta, usuario, favoritosIds, historialIds, costoAproximado)
                RecomendacionRecetaDTO(
                    receta = recetaMapper.toRecetaResumenDTO(listOf(receta), favoritosIds).first(),
                    puntaje = evaluacion.puntaje,
                    costoAproximado = costoAproximado,
                    motivos = evaluacion.motivos,
                    ingredientesCoincidentes = receta.ingredientesCoincidentesCon(usuario).map { it.nombre }.toSet(),
                    ingredientesFaltantes = receta.ingredientesFaltantesPara(usuario).map { it.nombre }.toSet()
                )
            }
            .sortedWith(compareByDescending<RecomendacionRecetaDTO> { it.puntaje }.thenBy { it.receta.tiempoEstimadoMinutos })
            .take(limiteNormalizado)
    }

    private fun buscarCandidatas(usuario: Usuario, limite: Int): List<Receta> {
        val cantidadCandidatas = (limite * MULTIPLICADOR_CANDIDATAS).coerceAtLeast(MINIMO_CANDIDATAS)
        val ingredientesComunesIds = idsParaQuery(usuario.ingredientesComunes().mapNotNull { it.id })
        val ingredientesAEvitarIds = idsParaQuery(usuario.ingredientesAEvitar().mapNotNull { it.id })
        val candidatasIds = recetaRepository.findIdsCandidatasParaRecomendacion(
            ingredientesComunesIds = ingredientesComunesIds,
            ingredientesAEvitarIds = ingredientesAEvitarIds,
            pageable = PageRequest.of(0, cantidadCandidatas)
        )

        if (candidatasIds.isEmpty()) return emptyList()

        val ordenPorId = candidatasIds.withIndex().associate { it.value to it.index }

        return recetaRepository.findAllWithDetailsByIdIn(candidatasIds)
            .sortedBy { receta -> ordenPorId[receta.id] ?: Int.MAX_VALUE }
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

    private fun costoAproximado(
        receta: Receta,
        preciosPorIngredienteId: Map<Long, PrecioIngrediente>
    ): Double {
        val costo = receta.ingredientes.sumOf { recetaIngrediente ->
            val ingredienteId = recetaIngrediente.ingrediente.id ?: return@sumOf 0.0
            val precio = preciosPorIngredienteId[ingredienteId] ?: return@sumOf 0.0

            recetaIngrediente.costoEstimado(precio)
        }

        return (costo * 100).roundToInt() / 100.0
    }

    /* Evaluar receta solamente agrega un puntaje y un array de motivos
    De esta manera podemos ofrecerle al usuario un scoring en base a su configuración
    Y la explicación de por qué a través de los motivos */
    private fun evaluarReceta(
        receta: Receta,
        usuario: Usuario,
        favoritosIds: Set<Long>,
        historialIds: Set<Long>,
        costoAproximado: Double
    ): EvaluacionRecomendacion {
        var puntaje = 0
        val motivos = mutableListOf<String>()

        val coincidencias = receta.ingredientesCoincidentesCon(usuario)
        val faltantes = receta.ingredientesFaltantesPara(usuario)
        val ingredientesAEvitar = ingredientesAEvitarPresentes(receta, usuario)
        val compatibleConObjetivo = receta.esCompatibleConObjetivo(usuario.objetivo)
        val cumpleRestricciones = receta.cumpleRestricciones(usuario.restriccionesAlimentarias)
        val totalIngredientes = receta.ingredientes.size

        if (coincidencias.isNotEmpty()) {
            puntaje += puntosPorIngredientes(coincidencias.size, totalIngredientes, faltantes.size, usuario.perfilEconomico)
            motivos.add("Usa ${coincidencias.size} ingrediente(s) comun(es) del usuario")
        }

        if (faltantes.isEmpty() && receta.ingredientes.isNotEmpty()) {
            puntaje += PUNTOS_EXTRA_DESPENSA_COMPLETA
            motivos.add("El usuario ya tiene todos los ingredientes principales cargados como comunes")
        }

        if (cumpleRestricciones) {
            puntaje += PUNTOS_RESTRICCIONES
            motivos.add("Cumple las restricciones alimentarias del usuario")
        } else {
            val restriccionesIncumplidas = restriccionesIncumplidas(receta, usuario)
            motivos.add("Requiere adaptar ingredientes para cumplir: ${restriccionesIncumplidas.joinToString(", ")}")
        }

        if (compatibleConObjetivo) {
            puntaje += PUNTOS_OBJETIVO
            motivos.add("Acompaña el objetivo actual del usuario")
        } else {
            motivos.add("No acompana del todo el objetivo actual del usuario")
        }

        if (receta.dificultad.ordinal <= usuario.nivelCocina.ordinal) {
            puntaje += PUNTOS_DIFICULTAD
            motivos.add("La dificultad encaja con el nivel de cocina del usuario")
        } else {
            val diferenciaDificultad = receta.dificultad.ordinal - usuario.nivelCocina.ordinal
            puntaje += (PUNTOS_DIFICULTAD - diferenciaDificultad * PENALIZACION_DIFICULTAD).coerceAtLeast(0)
            motivos.add("Puede ser mas dificil que el nivel de cocina del usuario")
        }

        if (ingredientesAEvitar.isNotEmpty()) {
            motivos.add("Contiene ingrediente(s) a evitar que podrian reemplazarse: ${ingredientesAEvitar.joinToString(", ")}")
        } else {
            puntaje += PUNTOS_INGREDIENTES_A_EVITAR
        }

        puntaje += puntosPorCosto(costoAproximado, usuario.perfilEconomico)
        motivos.add(motivoCosto(costoAproximado, usuario.perfilEconomico))

        if (receta.id?.let { it in favoritosIds } == true) {
            puntaje += MODIFICADOR_FAVORITO
            motivos.add("Ya esta marcada como favorita")
        }

        if (receta.id?.let { it in historialIds } == true) {
            puntaje -= MODIFICADOR_HISTORIAL
            motivos.add("Ya fue cocinada recientemente")
        }

        puntaje += puntosPorTiempo(receta.tiempoEnMinutos)

        return EvaluacionRecomendacion(puntaje.coerceIn(0, 100), motivos)
    }

    private fun puntosPorIngredientes(
        coincidencias: Int,
        totalIngredientes: Int,
        faltantes: Int,
        perfilEconomico: PerfilEconomico
    ): Int {
        if (totalIngredientes == 0) return 0

        val puntosBase = ((coincidencias.toDouble() / totalIngredientes) * PUNTOS_INGREDIENTES).roundToInt()
        val penalizacion = when (perfilEconomico) {
            PerfilEconomico.BAJO_PRESUPUESTO -> faltantes * 2
            PerfilEconomico.INTERMEDIO -> faltantes
            PerfilEconomico.FLEXIBLE -> 0
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

    private fun motivoCosto(costoAproximado: Double, perfilEconomico: PerfilEconomico): String {
        val costo = "${'$'}${costoAproximado.roundToInt()}"

        return when (perfilEconomico) {
            PerfilEconomico.BAJO_PRESUPUESTO -> "Costo aproximado $costo considerado para perfil de bajo presupuesto"
            PerfilEconomico.INTERMEDIO -> "Costo aproximado $costo considerado para perfil intermedio"
            PerfilEconomico.FLEXIBLE -> "Costo aproximado $costo considerado para perfil flexible"
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
            ObjetivoUsuario.COMER_SALUDABLE -> 20
            ObjetivoUsuario.BAJAR_PESO -> 20
            ObjetivoUsuario.GANAR_MASA_MUSCULAR -> 20
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
        const val PUNTOS_INGREDIENTES = 20
        const val PUNTOS_EXTRA_DESPENSA_COMPLETA = 5
        const val PUNTOS_RESTRICCIONES = 20
        const val PUNTOS_OBJETIVO = 20
        const val PUNTOS_DIFICULTAD = 15
        const val PUNTOS_INGREDIENTES_A_EVITAR = 10
        const val PUNTOS_COSTO = 10
        const val PENALIZACION_DIFICULTAD = 10
        const val MODIFICADOR_FAVORITO = 5
        const val MODIFICADOR_HISTORIAL = 5
    }
}

private data class EvaluacionRecomendacion(
    val puntaje: Int,
    val motivos: List<String>
)
