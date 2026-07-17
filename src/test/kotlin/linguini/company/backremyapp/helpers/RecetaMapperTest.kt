package linguini.company.backremyapp.helpers

import linguini.company.backremyapp.domain.TipoIngredienteReceta
import linguini.company.backremyapp.dto.BusquedaIngredientesSimilaresDTO
import linguini.company.backremyapp.dto.IngredienteSimilarDTO
import linguini.company.backremyapp.ingredienteFixture
import linguini.company.backremyapp.infoNutricionalFixture
import linguini.company.backremyapp.pasoFixture
import linguini.company.backremyapp.recetaFixture
import linguini.company.backremyapp.recetaIngredienteFixture
import linguini.company.backremyapp.services.IngredienteService
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test
import org.mockito.ArgumentMatchers.anyInt
import org.mockito.ArgumentMatchers.anySet
import org.mockito.ArgumentMatchers.anyString
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.mockito.Mockito.`when`

class RecetaMapperTest {
    private val ingredienteService = mock(IngredienteService::class.java)
    private val mapper = RecetaMapper(ingredienteService)

    @Test
    fun `toFullDTO mapea receta completa con ingredientes pasos restricciones e info nutricional`() {
        val receta = recetaFixture(nombre = "Bowl proteico", porciones = 2)
        receta.tiempoEnMinutos = 20
        receta.imgUrl = "img.jpg"
        receta.tags.add("saludable")
        receta.agregarPaso(pasoFixture(1, 20, "Preparar"))
        receta.agregarIngrediente(
            recetaIngredienteFixture(
                ingredienteFixture(
                    id = 1,
                    nombre = "Tofu",
                    infoNutricional = infoNutricionalFixture(120.0, 15.0, 4.0, 6.0)
                ),
                cantidad = 200.0,
                id = 10
            )
        )

        val dto = mapper.toFullDTO(receta)

        assertEquals("Bowl proteico", dto.nombre)
        assertEquals("saludable", dto.tags.single())
        assertEquals("Tofu", dto.ingredientes.single().nombre)
        assertEquals(240.0, dto.infoNutricional.calorias)
        assertEquals(30.0, dto.infoNutricional.proteinas)
        assertFalse(dto.favorito)
    }

    @Test
    fun `toFullDTO contextual filtra opcionales a evitar y sugiere reemplazos para faltantes`() {
        val reemplazo = BusquedaIngredientesSimilaresDTO(
            nombreBuscado = "Queso",
            encontrado = true,
            resultados = listOf(
                IngredienteSimilarDTO(99, "Tofu firme", "PROTEINAS_VEGETALES", setOf("vegano"), 0.91)
            )
        )
        `when`(
            ingredienteService.sugerirReemplazo(anyString(), anySet(), anyInt(), anySet())
        ).thenReturn(reemplazo)

        val receta = recetaFixture(nombre = "Tacos", porciones = 2)
        receta.agregarIngrediente(
            recetaIngredienteFixture(ingredienteFixture(1, "Queso"), 100.0, TipoIngredienteReceta.REEMPLAZABLE)
        )
        receta.agregarIngrediente(
            recetaIngredienteFixture(ingredienteFixture(2, "Pimienta negra"), 2.0, TipoIngredienteReceta.OPCIONAL)
        )

        val dto = mapper.toFullDTO(
            receta = receta,
            ingredientesFaltantes = setOf("queso"),
            ingredientesAEvitar = setOf("pimienta negra"),
            restriccionesUsuario = setOf("vegano"),
            favorito = true
        )

        assertEquals(listOf("Queso"), dto.ingredientes.map { it.nombre })
        assertNotNull(dto.ingredientes.single().reemplazo)
        assertEquals(true, dto.favorito)
        verify(ingredienteService).sugerirReemplazo(
            "Queso",
            setOf("vegano"),
            5,
            setOf("Queso")
        )
    }

    @Test
    fun `toRecetaResumenDTO marca favoritos cuando recibe ids y por defecto los marca true`() {
        val favorita = recetaFixture(id = 1, nombre = "Favorita")
        val noFavorita = recetaFixture(id = 2, nombre = "Otra")

        val conFavoritos = mapper.toRecetaResumenDTO(listOf(favorita, noFavorita), setOf(1))
        val sinIds = mapper.toRecetaResumenDTO(listOf(noFavorita), null)

        assertEquals(true, conFavoritos.first().favorito)
        assertEquals(false, conFavoritos.last().favorito)
        assertEquals(true, sinIds.single().favorito)
    }
}
