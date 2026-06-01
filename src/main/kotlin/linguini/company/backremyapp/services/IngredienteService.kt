package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.CategoriaIngrediene
import linguini.company.backremyapp.domain.Ingrediente
import linguini.company.backremyapp.dto.BusquedaIngredientesSimilaresDTO
import linguini.company.backremyapp.dto.IngredienteSimilarDTO
import linguini.company.backremyapp.repositories.IngredienteRepository
import org.springframework.data.domain.PageRequest
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class IngredienteService(val ingredienteRepository: IngredienteRepository) {
    @Transactional(readOnly = true)
    fun buscarPorNombre(query: String, limite: Int): List<String> {
        val pageable = PageRequest.of(0, limite)
        return ingredienteRepository.buscarNombres(query.trim(), pageable)
    }

    @Transactional(readOnly = true)
    fun topSimilares(nombreBusqueda: String, limite: Int): BusquedaIngredientesSimilaresDTO {
        val nombreNormalizado = nombreBusqueda.trim()
        val ingredienteBase = ingredienteRepository.findByNombreIgnoreCaseWithRestricciones(nombreNormalizado)
            ?: return ingredienteNoEncontrado(nombreNormalizado)

        val limiteNormalizado = limite.coerceIn(1, MAX_RESULTADOS_SIMILARES)
        val similares = buscarSimilaresOrdenados(ingredienteBase.nombre, limiteNormalizado)

        return BusquedaIngredientesSimilaresDTO(
            nombreBuscado = nombreNormalizado,
            encontrado = true,
            resultados = similares
        )
    }

    @Transactional(readOnly = true)
    fun sugerirReemplazo(
        nombreIngrediente: String,
        restriccionesUsuario: Set<String>,
        limite: Int
    ): BusquedaIngredientesSimilaresDTO {
        val nombreNormalizado = nombreIngrediente.trim()
        val ingredienteBase = ingredienteRepository.findByNombreIgnoreCaseWithRestricciones(nombreNormalizado)
            ?: return ingredienteNoEncontrado(nombreNormalizado)

        val restriccionesNormalizadas = restriccionesUsuario
            .map { it.trim().lowercase() }
            .filter { it.isNotBlank() }
            .toSet()
        val limiteNormalizado = limite.coerceIn(1, MAX_RESULTADOS_REEMPLAZOS)

        val reemplazos = buscarSimilaresOrdenados(ingredienteBase.nombre, MAX_RESULTADOS_REEMPLAZOS)
            .filter { candidato ->
                val restriccionesCandidato = candidato.restricciones.map { it.lowercase() }.toSet()
                restriccionesNormalizadas.all { it in restriccionesCandidato } &&
                    categoriaCompatible(ingredienteBase.categoria, CategoriaIngrediene.valueOf(candidato.categoria))
            }
            .take(limiteNormalizado)

        return BusquedaIngredientesSimilaresDTO(
            nombreBuscado = nombreNormalizado,
            encontrado = true,
            resultados = reemplazos
        )
    }

    private fun ingredienteNoEncontrado(nombreBusqueda: String): BusquedaIngredientesSimilaresDTO {
        val coincidencias = ingredienteRepository.buscarNombresQueContienen(
            nombreBusqueda,
            PageRequest.of(0, LIMITE_COINCIDENCIAS)
        )

        return BusquedaIngredientesSimilaresDTO(
            nombreBuscado = nombreBusqueda,
            encontrado = false,
            coincidencias = coincidencias
        )
    }

    private fun buscarSimilaresOrdenados(nombreBase: String, limite: Int): List<IngredienteSimilarDTO> {
        val similares = ingredienteRepository.buscarIdsSimilaresPorEmbedding(
            nombreBase,
            PageRequest.of(0, limite)
        )
        if (similares.isEmpty()) return emptyList()

        val scoresPorId = similares.associate { it.id to it.score }
        val ordenPorId = similares.withIndex().associate { it.value.id to it.index }

        return ingredienteRepository.findAllWithRestriccionesByIdIn(scoresPorId.keys)
            .sortedBy { ordenPorId[it.id] ?: Int.MAX_VALUE }
            .map { ingrediente -> ingrediente.toSimilarDTO(scoresPorId[ingrediente.id] ?: 0.0) }
    }

    private fun Ingrediente.toSimilarDTO(score: Double): IngredienteSimilarDTO {
        return IngredienteSimilarDTO(
            id = id,
            nombre = nombre,
            categoria = categoria.name,
            restricciones = restriccionesAlimentarias.map { it.nombre }.toSet(),
            score = score
        )
    }

    private fun categoriaCompatible(original: CategoriaIngrediene, candidata: CategoriaIngrediene): Boolean {
        return original == candidata ||
            (original == CategoriaIngrediene.PROTEINAS_ANIMALES && candidata == CategoriaIngrediene.PROTEINAS_VEGETALES) ||
            (original == CategoriaIngrediene.PROTEINAS_VEGETALES && candidata == CategoriaIngrediene.PROTEINAS_ANIMALES)
    }

    companion object {
        private const val LIMITE_COINCIDENCIAS = 5
        private const val MAX_RESULTADOS_SIMILARES = 5
        private const val MAX_RESULTADOS_REEMPLAZOS = 5
    }
}
