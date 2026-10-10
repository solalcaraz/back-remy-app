package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Ingrediente
import linguini.company.backremyapp.domain.ObjetivoUsuario
import linguini.company.backremyapp.domain.PerfilEconomico
import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.TipoIngredienteReceta
import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.RecomendacionRecetaDTO
import linguini.company.backremyapp.dto.RecomendacionPaginadaDTO
import linguini.company.backremyapp.dto.RecomendacionRequest
import linguini.company.backremyapp.dto.SugerenciaDiariaDTO
import linguini.company.backremyapp.helpers.RecetaMapper
import linguini.company.backremyapp.helpers.normalizarTexto
import linguini.company.backremyapp.repositories.FavoritoRecetaRepository
import linguini.company.backremyapp.repositories.HistorialRecetaRepository
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import linguini.company.backremyapp.exceptions.NotFoundException
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageImpl
import org.springframework.data.domain.PageRequest
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import kotlin.math.roundToInt
import java.util.UUID

@Service
class RecomendacionService(
    private val usuarioRepository: UsuarioRepository,
    private val recetaRepository: RecetaRepository,
    private val ingredienteRepository: IngredienteRepository,
    private val favoritoRecetaRepository: FavoritoRecetaRepository,
    private val historialRecetaRepository: HistorialRecetaRepository,
    private val recetaMapper: RecetaMapper
) {
    @Transactional(readOnly = true)
    fun recomendarRecetas(usuarioId: UUID, req: RecomendacionRequest, page: Int): RecomendacionPaginadaDTO {
        val usuario = usuarioRepository.findPerfilById(usuarioId)
            .orElseThrow { NotFoundException("Usuario no encontrado") }

        val paginaNormalizada = page.coerceAtLeast(0)

        val busquedaActiva = req.ingredientesExtra.isNotEmpty()
        val ingredientesDisponibles = resolverIngredientesDisponibles(usuario, req.ingredientesExtra, busquedaActiva)

        val restriccionesIds = usuario.restriccionesAlimentarias.mapNotNull { it.id }.ifEmpty { null }
        val ingredientesAEvitarIds = idsParaQuery(usuario.ingredientesAEvitar().mapNotNull { it.id })

        val recetasPage = buscarCandidatas(
            ingredientesDisponibles.ids,
            restriccionesIds,
            ingredientesAEvitarIds,
            req.tiempoMaximo,
            req.puedeComprar,
            paginaNormalizada,
            TAMANIO_PAGINA_RECOMENDACIONES
        )
        val recetas = recetasPage.content

        if (recetas.isEmpty()) {
            return RecomendacionPaginadaDTO(
                data = emptyList(),
                page = paginaNormalizada,
                size = TAMANIO_PAGINA_RECOMENDACIONES,
                totalItems = recetasPage.totalElements,
                totalPage = recetasPage.totalPages
            )
        }

        val favoritosIds = favoritoRecetaRepository.findRecetaIdsByUsuarioId(usuarioId)
        val historialIds = historialRecetaRepository.findRecetasByUsuarioId(usuarioId)
            .mapNotNull { it.id }
            .toSet()

        val recetasResumenMap = recetaMapper.toRecetaResumenDTO(recetas, favoritosIds).associateBy { it.id }
        val ingredientesDisponiblesNombres = ingredientesDisponibles.nombres.toSet()

        val recomendaciones = recetas
            .map { receta ->
                val costoAproximado = receta.costoTotalCompra
                val ingredientesReceta = receta.ingredientes.map { it.ingrediente.nombre }
                val ingredientesCoincidentes = ingredientesReceta
                    .filter { it.lowercase() in ingredientesDisponiblesNombres }
                    .toSet()
                val ingredientesFaltantes = ingredientesReceta
                    .filter { it !in ingredientesCoincidentes }
                    .toSet()
                val evaluacion = evaluarReceta(
                    receta, usuario, ingredientesDisponibles.nombres, ingredientesDisponibles.nombresInput,
                    favoritosIds, historialIds, costoAproximado, req.puedeComprar, busquedaActiva
                )
                RecomendacionRecetaDTO(
                    receta = recetasResumenMap[receta.id]!!,
                    puntaje = evaluacion.puntaje,
                    costoAproximado = costoAproximado,
                    motivosPositivos = evaluacion.motivosPositivos,
                    motivosNegativos = evaluacion.motivosNegativos,
                    ingredientesCoincidentes = ingredientesCoincidentes,
                    ingredientesFaltantes = ingredientesFaltantes
                )
            }
            .sortedWith(
                compareByDescending<RecomendacionRecetaDTO> { it.puntaje }
                    .thenBy { it.receta.tiempoEnMinutos }
            )
            .drop(paginaNormalizada * TAMANIO_PAGINA_RECOMENDACIONES)
            .take(TAMANIO_PAGINA_RECOMENDACIONES)

        return RecomendacionPaginadaDTO(
            data = recomendaciones,
            page = paginaNormalizada,
            size = TAMANIO_PAGINA_RECOMENDACIONES,
            totalItems = recetasPage.totalElements,
            totalPage = totalPages(recetasPage.totalElements, TAMANIO_PAGINA_RECOMENDACIONES)
        )
    }

    @Transactional(readOnly = true)
    fun sugerenciaDiaria(usuarioId: UUID): SugerenciaDiariaDTO {
        val usuario = usuarioRepository.findPerfilById(usuarioId).orElseThrow { NotFoundException("Usuario no encontrado") }

        val ingredientesDisponibles = resolverIngredientesDisponibles(usuario, emptyList(), busquedaActiva = false)
        val ingredientesAEvitarIds = idsParaQuery(usuario.ingredientesAEvitar().mapNotNull { it.id })
        val restriccionesIds = usuario.restriccionesAlimentarias.mapNotNull { it.id }.ifEmpty { null }

        val recetasIniciales = buscarCandidatas(
            ingredientesDisponibles.ids,
            restriccionesIds,
            ingredientesAEvitarIds,
            null,
            true,
            0,
            LIMITE_SUGERENCIA_DIARIA
        ).content

        val recetas = recetasIniciales.ifEmpty {
            buscarFallbackSugerenciaDiaria(usuario)
        }

        if(recetas.isEmpty()) throw NotFoundException("No hay recetas disponibles para tu perfil")

        val favoritosIds = favoritoRecetaRepository.findRecetaIdsByUsuarioId(usuarioId)
        val historialIds = historialRecetaRepository.findRecetasByUsuarioId(usuarioId)
            .mapNotNull { it.id }.toSet()

        // Se elige al azar entre las mejor puntuadas para que la sugerencia cambie entre visitas sin dejar de ser relevante.
        val candidatasTop = recetas
            .map { receta ->
                val costo = receta.costoTotalCompra
                val evaluacion = evaluarReceta(
                    receta, usuario, ingredientesDisponibles.nombres, emptyList(),
                    favoritosIds, historialIds, costo, puedeComprar = true, busquedaActiva = false
                )
                Pair(receta, evaluacion)
            }
            .sortedWith(
                compareByDescending<Pair<Receta, EvaluacionRecomendacion>> { (_, eval) -> eval.puntaje }
            )
            .take(TOP_SUGERENCIAS_RANDOM)

        val (recetaElegida, evaluacion) = candidatasTop.random()

        val resumen = recetaMapper.toRecetaResumenDTO(listOf(recetaElegida), favoritosIds).first()

        return SugerenciaDiariaDTO(
            receta = resumen,
            motivosPositivos = evaluacion.motivosPositivos
        )
    }

    private fun buscarFallbackSugerenciaDiaria(usuario: Usuario): List<Receta> {
        val ingredientesAEvitarIds = usuario.ingredientesAEvitar()
            .mapNotNull { it.id }
            .toSet()

        val recetasSinIngredientesAEvitar = recetaRepository.findAllWithDetailsBy()
            .asSequence()
            .filterNot { receta ->
                receta.ingredientes.any { recetaIngrediente ->
                    recetaIngrediente.tipo == TipoIngredienteReceta.CORE &&
                        recetaIngrediente.ingrediente.id in ingredientesAEvitarIds
                }
            }
            .toList()

        val compatibles = recetasSinIngredientesAEvitar
            .filter { receta -> receta.cumpleRestricciones(usuario.restriccionesAlimentarias) }

        return compatibles.ifEmpty { recetasSinIngredientesAEvitar }
            .asSequence()
            .sortedWith(compareBy<Receta> { it.tiempoEnMinutos }.thenBy { it.id ?: Long.MAX_VALUE })
            .take(LIMITE_SUGERENCIA_DIARIA)
            .toList()
    }

    private fun buscarCandidatas(
        ingredientesDisponiblesIds: List<Long>,
        restriccionesIds: List<Long>?,
        ingredientesAEvitarIds: List<Long>,
        tiempoMaximo: Int?,
        puedeComprar: Boolean,
        page: Int,
        size: Int
    ): Page<Receta> {
        val cantidadCandidatas = ((page + 1) * size * MULTIPLICADOR_POOL_RECOMENDACIONES)
            .coerceAtMost(LIMITE_POOL_RECOMENDACIONES)
        val pageable = PageRequest.of(0, cantidadCandidatas)
        val idsDisponiblesParaQuery = idsParaQuery(ingredientesDisponiblesIds)
        val idsAEvitarParaQuery = idsParaQuery(ingredientesAEvitarIds)

        val candidatasIds = if (puedeComprar) {
            // Alcanza con un ingrediente disponible: el resto se puede comprar.
            recetaRepository.findIdsConAlgunIngredienteDisponible(
                ingredientesDisponiblesIds = idsDisponiblesParaQuery,
                ingredientesAEvitarIds = idsAEvitarParaQuery,
                restriccionesIds = restriccionesIds,
                tiempoMaximo = tiempoMaximo,
                pageable = pageable
            )
        } else {
            // Todos los core disponibles y hasta 5 reemplazables faltantes; los opcionales no cuentan.
            recetaRepository.findIdsConIngredientesSuficientes(
                ingredientesDisponiblesIds = idsDisponiblesParaQuery,
                ingredientesAEvitarIds = idsAEvitarParaQuery,
                restriccionesIds = restriccionesIds,
                tiempoMaximo = tiempoMaximo,
                pageable = pageable
            )
        }

        if (candidatasIds.content.isEmpty()) {
            return PageImpl(emptyList(), pageable, candidatasIds.totalElements)
        }

        val ordenPorId = candidatasIds.content.withIndex().associate { it.value to it.index }
        val recetas = recetaRepository.findAllWithDetailsByIdIn(candidatasIds.content)
            .sortedBy { receta -> ordenPorId[receta.id] ?: Int.MAX_VALUE }

        return PageImpl(recetas, pageable, candidatasIds.totalElements)
    }

    private fun totalPages(totalItems: Long, size: Int): Int {
        if (totalItems == 0L) return 0
        return ((totalItems + size - 1) / size).toInt()
    }

    private fun resolverIngredientesDisponibles(
        usuario: Usuario,
        ingredientesExtra: List<String>,
        busquedaActiva: Boolean
    ): IngredientesDisponiblesBusqueda {
        val ingredientesComunes = usuario.ingredientesComunes()
        // Búsqueda por texto parcial y sin tildes: el usuario puede escribir "brocoli" sin elegir la sugerencia exacta.
        val ingredientesInput = if (busquedaActiva) {
            ingredientesExtra
                .map { it.trim() }
                .filter { it.isNotBlank() }
                .flatMap { buscarIngredientesPorTextoNormalizado(it) }
                .distinctBy { it.id }
        } else {
            emptyList()
        }

        val ids = (ingredientesComunes.mapNotNull { it.id } + ingredientesInput.mapNotNull { it.id })
            .distinct()
        val nombresInput = ingredientesInput.map { it.nombre.lowercase() }.distinct()
        val nombres = (ingredientesComunes.map { it.nombre.lowercase() } + nombresInput)
            .distinct()

        return IngredientesDisponiblesBusqueda(ids, nombres, nombresInput)
    }

    private fun buscarIngredientesPorTextoNormalizado(texto: String): List<Ingrediente> {
        val query = normalizarTexto(texto)
        if (query.isBlank()) return emptyList()

        return ingredienteRepository.findAll()
            .filter { ingrediente -> normalizarTexto(ingrediente.nombre).contains(query) }
            .sortedBy { it.nombre }
    }

    private fun idsParaQuery(ids: List<Long>): List<Long> {
        return ids.ifEmpty { listOf(ID_INEXISTENTE) }
    }

    // Cada regla suma o resta puntos y deja un motivo, para que el usuario vea por qué la receta quedó en ese lugar.
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

        val ingredientesAEvitar = ingredientesAEvitarPresentes(receta, usuario)
        val compatibleConObjetivo = receta.esCompatibleConObjetivo(usuario.objetivo)
        val cumpleRestricciones = receta.cumpleRestricciones(usuario.restriccionesAlimentarias)

        val disponiblesSet = ingredientesDisponibles.toSet()
        val ingredientesReceta = receta.ingredientes.filter { it.tipo == TipoIngredienteReceta.CORE }
        val totalIngredientes = ingredientesReceta.size

        val nombresReceta = ingredientesReceta.map { it.ingrediente.nombre.lowercase() }
        val coincidenciasTotales = nombresReceta.count { it in disponiblesSet }
        val coincidenciasRequest = ingredientesExtra.count { it in nombresReceta }
        val faltantes = totalIngredientes - coincidenciasTotales

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

        if (usuario.restriccionesAlimentarias.isEmpty()) {
            // No se premia cumplir una restricción que el usuario no pidió.
        } else if (cumpleRestricciones) {
            puntaje += PUNTOS_RESTRICCIONES
            motivosPositivos.add("Cumple tus restricciones alimentarias")
        } else {
            val restriccionesIncumplidas = restriccionesIncumplidas(receta, usuario)
            motivosNegativos.add("Requiere adaptar ingredientes para cumplir: ${restriccionesIncumplidas.joinToString(", ")}")
        }

        val ajusteVariante = ajustePorVarianteDietetica(receta, usuario)
        puntaje += ajusteVariante.puntaje
        ajusteVariante.motivoNegativo?.let { motivosNegativos.add(it) }

        if (compatibleConObjetivo) {
            puntaje += puntosPorObjetivo(usuario.objetivo)
            if (usuario.objetivo != ObjetivoUsuario.INDIFERENTE) motivosPositivos.add("Acompaña tu objetivo actual")
        } else {
            motivosNegativos.add("No acompaña del todo tu objetivo: ${usuario.objetivo.label}")
        }

        val diferenciaDificultad = receta.dificultad.ordinal - usuario.nivelCocina.ordinal
        if (diferenciaDificultad <= 0) {
            puntaje += PUNTOS_DIFICULTAD
            motivosPositivos.add("La dificultad es adecuada para tu nivel")
        } else {
            puntaje += (PUNTOS_DIFICULTAD - diferenciaDificultad * PENALIZACION_DIFICULTAD).coerceAtLeast(0)
            motivosNegativos.add("Puede ser mas dificil que tu nivel de cocina actual")
        }


        if (!receta.contieneIngredienteAEvitar(usuario)) {
            puntaje += PUNTOS_SIN_INGREDIENTES_A_EVITAR
        } else {
            motivosNegativos.add("Contiene ingrediente(s) que preferis evitar: ${ingredientesAEvitar.joinToString(", ")}")
        }

        puntaje += puntosPorCosto(costoAproximado, usuario.perfilEconomico)
        motivoCosto(costoAproximado, usuario.perfilEconomico, motivosPositivos, motivosNegativos)

        if (receta.id?.let { it in favoritosIds } == true) {
            puntaje += MODIFICADOR_FAVORITO
            motivosPositivos.add("Ya esta marcada como favorita")
        }

        if (receta.id?.let { it in historialIds } == true) {
            puntaje -= MODIFICADOR_HISTORIAL
            motivosNegativos.add("Ya fue cocinada recientemente")
        }

        val puntosTiempo = puntosPorTiempo(receta.tiempoEnMinutos)
        puntaje += puntosTiempo
        if (puntosTiempo == PUNTOS_TIEMPO_RAPIDO)
            motivosPositivos.add("Receta rápida (${receta.tiempoEnMinutos} min)")

        val maxScorePerfil = maxScoreTeorico(usuario, peso)
        val puntajeNormalizado = ((puntaje.toDouble() / maxScorePerfil) * 100).roundToInt().coerceIn(0, 100)

        return EvaluacionRecomendacion(puntajeNormalizado, motivosPositivos, motivosNegativos)
    }

    private fun puntosPorIngredientes(
        coincidencias: Int,
        totalIngredientes: Int,
        faltantes: Int,
        perfilEconomico: PerfilEconomico,
        puedeComprar: Boolean,
        peso: Double
    ): Int {
        if (totalIngredientes == 0) return 0

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

    // El máximo se calcula por usuario (no suma restricciones si no tiene ninguna): así el 0-100 es comparable
    // y dos recetas buenas no terminan ambas en 100.
    private fun maxScoreTeorico(usuario: Usuario, pesoIngredientes: Double): Int {
        val maxIngredientes = (PUNTOS_INGREDIENTES * pesoIngredientes)
            .roundToInt()
            .coerceAtMost(PUNTOS_INGREDIENTES)
        val maxRestricciones = if (usuario.restriccionesAlimentarias.isEmpty()) 0 else PUNTOS_RESTRICCIONES

        return maxIngredientes +
            PUNTOS_EXTRA_DESPENSA_COMPLETA +
            maxRestricciones +
            puntosPorObjetivo(usuario.objetivo) +
            PUNTOS_DIFICULTAD +
            PUNTOS_SIN_INGREDIENTES_A_EVITAR +
            PUNTOS_COSTO +
            PUNTOS_RECETA_BASE +
            PUNTOS_TIEMPO_RAPIDO
    }

    private fun ajustePorVarianteDietetica(receta: Receta, usuario: Usuario): AjusteVarianteDietetica {
        val tags = receta.tags.map { it.lowercase() }.toSet()
        val esVariante = "variante" in tags
        if (!esVariante) return AjusteVarianteDietetica(PUNTOS_RECETA_BASE, null)

        val restriccionesUsuario = usuario.restriccionesAlimentarias.map { it.nombre }.toSet()
        val necesitaVeganoOVegetariano = restriccionesUsuario.any { it == "vegano" || it == "vegetariano" }
        val necesitaSinGluten = "sin_gluten" in restriccionesUsuario

        val esVarianteVeggie = tags.any { it == "vegana" || it == "vegano" || it == "vegetariana" || it == "vegetariano" }
        val esVarianteSinGluten = tags.any { it == "sin_gluten" || it == "celiaca" || it == "celiaco" }

        val penalizaciones = listOf(
            esVarianteVeggie && !necesitaVeganoOVegetariano,
            esVarianteSinGluten && !necesitaSinGluten
        ).count { it }

        if (penalizaciones == 0) return AjusteVarianteDietetica(0, null)

        return AjusteVarianteDietetica(
            puntaje = -PENALIZACION_VARIANTE_DIETETICA * penalizaciones,
            motivoNegativo = "Es una variante dietaria que no coincide con tus restricciones actuales"
        )
    }

    private fun puntosPorCosto(costoAproximado: Double, perfilEconomico: PerfilEconomico): Int {
        return when (perfilEconomico) {
            PerfilEconomico.BAJO_PRESUPUESTO -> when {
                costoAproximado <= LIMITE_COSTO_BAJO_PRESUPUESTO -> PUNTOS_COSTO
                costoAproximado <= LIMITE_COSTO_INTERMEDIO -> 4
                else -> 0
            }
            PerfilEconomico.INTERMEDIO -> when {
                costoAproximado <= LIMITE_COSTO_INTERMEDIO -> PUNTOS_COSTO
                else -> 0
            }
            PerfilEconomico.FLEXIBLE -> when {
                costoAproximado > LIMITE_COSTO_INTERMEDIO -> PUNTOS_COSTO
                else -> 8
            }
        }
    }

    private fun motivoCosto(costoAproximado: Double, perfilEconomico: PerfilEconomico, motivosPositivos: MutableList<String>, motivosNegativos: MutableList<String>) {
        val costo = "${'$'}${costoAproximado.roundToInt()}"

        when (perfilEconomico) {
            PerfilEconomico.BAJO_PRESUPUESTO -> when {
                costoAproximado <= LIMITE_COSTO_BAJO_PRESUPUESTO -> motivosPositivos.add("Costo accesible para tu presupuesto ($costo)")
                costoAproximado <= LIMITE_COSTO_INTERMEDIO -> motivosNegativos.add("Costo intermedio para tu presupuesto ($costo)")
                else -> motivosNegativos.add("Costo elevado para tu presupuesto ($costo)")
            }
            PerfilEconomico.INTERMEDIO -> when {
                costoAproximado <= LIMITE_COSTO_BAJO_PRESUPUESTO -> motivosPositivos.add("Costo bajo para tu perfil ($costo)")
                costoAproximado <= LIMITE_COSTO_INTERMEDIO -> motivosPositivos.add("Costo moderado para tu perfil ($costo)")
                else -> motivosNegativos.add("Costo elevado para tu perfil ($costo)")
            }
            PerfilEconomico.FLEXIBLE -> when {
                costoAproximado <= LIMITE_COSTO_BAJO_PRESUPUESTO -> motivosPositivos.add("Costo bajo para tu perfil flexible ($costo)")
                costoAproximado <= LIMITE_COSTO_INTERMEDIO -> motivosPositivos.add("Costo intermedio para tu perfil flexible ($costo)")
                else -> motivosPositivos.add("Costo dentro de tu perfil flexible ($costo)")
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
            .filter { recetaIngrediente ->
                recetaIngrediente.tipo == TipoIngredienteReceta.CORE &&
                    recetaIngrediente.ingrediente.id in ingredientesAEvitarIds
            }
            .map { it.ingrediente.nombre }
            .distinct()
    }

    private fun puntosPorObjetivo(objetivo: ObjetivoUsuario): Int {
        return when (objetivo) {
            ObjetivoUsuario.INDIFERENTE -> 5
            ObjetivoUsuario.COMER_SALUDABLE -> PUNTOS_OBJETIVO
            ObjetivoUsuario.BAJAR_PESO -> PUNTOS_OBJETIVO
            ObjetivoUsuario.GANAR_MASA_MUSCULAR -> PUNTOS_OBJETIVO
        }
    }

    private fun puntosPorTiempo(tiempoEnMinutos: Int): Int {
        return when {
            tiempoEnMinutos <= MINUTOS_RECETA_RAPIDA -> PUNTOS_TIEMPO_RAPIDO
            tiempoEnMinutos <= MINUTOS_RECETA_MEDIA -> PUNTOS_TIEMPO_MEDIO
            else -> 0
        }
    }

    private companion object {
        const val ID_INEXISTENTE = -1L
        const val LIMITE_SUGERENCIA_DIARIA = 30
        const val TOP_SUGERENCIAS_RANDOM = 5
        const val TAMANIO_PAGINA_RECOMENDACIONES = 10
        const val MULTIPLICADOR_POOL_RECOMENDACIONES = 5
        const val LIMITE_POOL_RECOMENDACIONES = 100

        const val PUNTOS_INGREDIENTES = 30
        const val PUNTOS_RESTRICCIONES = 20
        const val PUNTOS_OBJETIVO = 15
        const val PUNTOS_DIFICULTAD = 15
        const val PUNTOS_SIN_INGREDIENTES_A_EVITAR = 10
        const val PUNTOS_COSTO = 10
        const val PUNTOS_RECETA_BASE = 4
        const val LIMITE_COSTO_BAJO_PRESUPUESTO = 15000.0
        const val LIMITE_COSTO_INTERMEDIO = 25000.0

        const val PUNTOS_EXTRA_DESPENSA_COMPLETA = 5
        const val PENALIZACION_DIFICULTAD = 5
        const val PENALIZACION_VARIANTE_DIETETICA = 10
        const val MODIFICADOR_FAVORITO = 5
        const val MODIFICADOR_HISTORIAL = 5
        const val PUNTOS_TIEMPO_RAPIDO = 5
        const val PUNTOS_TIEMPO_MEDIO = 3
        const val MINUTOS_RECETA_RAPIDA = 20
        const val MINUTOS_RECETA_MEDIA = 45

        // Si el usuario escribe ingredientes en la búsqueda, la coincidencia pesa más que el resto de su perfil;
        // si solo se usa su despensa, pesan más objetivo, restricciones y dificultad.
        const val PESO_INGREDIENTES_BUSQUEDA = 1.2
        const val PESO_INGREDIENTES_PERFIL = 0.8
    }
}

private data class EvaluacionRecomendacion(
    val puntaje: Int,
    val motivosPositivos: List<String>,
    val motivosNegativos: List<String>
)

private data class AjusteVarianteDietetica(
    val puntaje: Int,
    val motivoNegativo: String?
)

private data class IngredientesDisponiblesBusqueda(
    val ids: List<Long>,
    val nombres: List<String>,
    val nombresInput: List<String>
)
