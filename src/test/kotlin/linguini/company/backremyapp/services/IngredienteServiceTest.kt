package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.CategoriaIngrediene
import linguini.company.backremyapp.dto.IngredienteSimilarDTO
import linguini.company.backremyapp.ingredienteFixture
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.IngredienteSimilarProjection
import linguini.company.backremyapp.restriccionFixture
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.mockito.Mockito.mock
import org.mockito.Mockito.`when`
import org.springframework.data.domain.PageRequest

class IngredienteServiceTest {
    private val repository = mock(IngredienteRepository::class.java)
    private val service = IngredienteService(repository)

    @Test
    fun `buscarPorNombre trimea query y delega limite`() {
        `when`(repository.buscarNombres("arr", PageRequest.of(0, 5)))
            .thenReturn(listOf("Arroz blanco"))

        assertEquals(listOf("Arroz blanco"), service.buscarPorNombre(" arr ", 5))
    }

    @Test
    fun `topSimilares devuelve coincidencias cuando ingrediente base no existe`() {
        `when`(repository.findByNombreIgnoreCaseWithRestricciones("tof")).thenReturn(null)
        `when`(repository.buscarNombresQueContienen("tof", PageRequest.of(0, 5)))
            .thenReturn(listOf("Tofu firme"))

        val resultado = service.topSimilares(" tof ", 5)

        assertFalse(resultado.encontrado)
        assertEquals("tof", resultado.nombreBuscado)
        assertEquals(listOf("Tofu firme"), resultado.coincidencias)
    }

    @Test
    fun `topSimilares conserva orden de embeddings y limita resultados`() {
        val base = ingredienteFixture(1, "Pollo", categoria = CategoriaIngrediene.PROTEINAS_ANIMALES)
        val tofu = ingredienteFixture(2, "Tofu", categoria = CategoriaIngrediene.PROTEINAS_VEGETALES)
        val seitan = ingredienteFixture(3, "Seitan", categoria = CategoriaIngrediene.PROTEINAS_VEGETALES)
        `when`(repository.findByNombreIgnoreCaseWithRestricciones("Pollo")).thenReturn(base)
        `when`(repository.buscarIdsSimilaresPorEmbedding("Pollo", PageRequest.of(0, 5)))
            .thenReturn(listOf(projection(3, 0.8), projection(2, 0.9)))
        `when`(repository.findAllWithRestriccionesByIdIn(setOf(3L, 2L)))
            .thenReturn(listOf(tofu, seitan))

        val resultado = service.topSimilares("Pollo", 99)

        assertTrue(resultado.encontrado)
        assertEquals(listOf("Seitan", "Tofu"), resultado.resultados.map(IngredienteSimilarDTO::nombre))
        assertEquals(listOf(0.8, 0.9), resultado.resultados.map(IngredienteSimilarDTO::score))
    }

    @Test
    fun `sugerirReemplazo filtra por restricciones categoria compatible y receta actual`() {
        val vegano = restriccionFixture(1, "vegano")
        val pollo = ingredienteFixture(1, "Pollo", categoria = CategoriaIngrediene.PROTEINAS_ANIMALES)
        val tofu = ingredienteFixture(
            2,
            "Tofu",
            restricciones = mutableSetOf(vegano),
            categoria = CategoriaIngrediene.PROTEINAS_VEGETALES
        )
        val queso = ingredienteFixture(
            3,
            "Queso",
            restricciones = mutableSetOf(),
            categoria = CategoriaIngrediene.LACTEOS
        )
        val seitanYaUsado = ingredienteFixture(
            4,
            "Seitan",
            restricciones = mutableSetOf(vegano),
            categoria = CategoriaIngrediene.PROTEINAS_VEGETALES
        )
        `when`(repository.findByNombreIgnoreCaseWithRestricciones("Pollo")).thenReturn(pollo)
        `when`(repository.buscarIdsSimilaresPorEmbedding("Pollo", PageRequest.of(0, 6)))
            .thenReturn(listOf(projection(2, 0.95), projection(3, 0.7), projection(4, 0.6)))
        `when`(repository.findAllWithRestriccionesByIdIn(setOf(2L, 3L, 4L)))
            .thenReturn(listOf(tofu, queso, seitanYaUsado))

        val resultado = service.sugerirReemplazo(
            nombreIngrediente = "Pollo",
            restriccionesUsuario = setOf("vegano"),
            limite = 3,
            ingredientesReceta = setOf("Seitan")
        )

        assertEquals(listOf("Tofu"), resultado.resultados.map { it.nombre })
    }

    private fun projection(idValue: Long, scoreValue: Double) = object : IngredienteSimilarProjection {
        override val id = idValue
        override val score = scoreValue
    }
}
