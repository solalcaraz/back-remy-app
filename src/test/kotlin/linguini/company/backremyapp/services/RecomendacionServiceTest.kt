package linguini.company.backremyapp.services

import linguini.company.backremyapp.dto.RecomendacionRequest
import linguini.company.backremyapp.helpers.RecetaMapper
import linguini.company.backremyapp.ingredienteFixture
import linguini.company.backremyapp.infoNutricionalFixture
import linguini.company.backremyapp.pasoFixture
import linguini.company.backremyapp.recetaFixture
import linguini.company.backremyapp.recetaIngredienteFixture
import linguini.company.backremyapp.repositories.FavoritoRecetaRepository
import linguini.company.backremyapp.repositories.HistorialRecetaRepository
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import linguini.company.backremyapp.usuarioFixture
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.mockito.Mockito.mock
import org.mockito.Mockito.`when`
import org.springframework.data.domain.PageImpl
import org.springframework.data.domain.PageRequest
import java.util.Optional
import java.util.UUID

class RecomendacionServiceTest {
    private val usuarioRepository = mock(UsuarioRepository::class.java)
    private val recetaRepository = mock(RecetaRepository::class.java)
    private val ingredienteRepository = mock(IngredienteRepository::class.java)
    private val favoritoRepository = mock(FavoritoRecetaRepository::class.java)
    private val historialRepository = mock(HistorialRecetaRepository::class.java)
    private val recetaMapper = RecetaMapper(mock(IngredienteService::class.java))
    private val service = RecomendacionService(
        usuarioRepository,
        recetaRepository,
        ingredienteRepository,
        favoritoRepository,
        historialRepository,
        recetaMapper
    )

    @Test
    fun `recomendarRecetas usa despensa e ingredientes extra normalizados para rankear candidatas`() {
        val usuarioId = UUID.randomUUID()
        val arroz = ingredienteFixture(
            id = 1,
            nombre = "Arroz blanco",
            infoNutricional = infoNutricionalFixture(120.0, 3.0, 25.0, 1.0)
        )
        val brocoli = ingredienteFixture(
            id = 2,
            nombre = "Brócoli",
            infoNutricional = infoNutricionalFixture(35.0, 4.0, 6.0, 0.5, 4.0)
        )
        val usuario = usuarioFixture()
        usuario.agregarIngredienteComun(arroz)
        val receta = recetaFixture(id = 10, nombre = "Arroz con brocoli", porciones = 2)
        receta.tiempoEnMinutos = 20
        receta.costoTotalCompra = 4_000.0
        receta.agregarPaso(pasoFixture(1, 20))
        receta.agregarIngrediente(recetaIngredienteFixture(arroz, 200.0))
        receta.agregarIngrediente(recetaIngredienteFixture(brocoli, 100.0))

        `when`(usuarioRepository.findPerfilById(usuarioId)).thenReturn(Optional.of(usuario))
        `when`(ingredienteRepository.findAll()).thenReturn(listOf(arroz, brocoli))
        `when`(
            recetaRepository.findIdsConAlgunIngredienteDisponible(
                listOf(1L, 2L),
                listOf(-1L),
                null,
                null,
                PageRequest.of(0, 50)
            )
        ).thenReturn(PageImpl(listOf(10L), PageRequest.of(0, 50), 1))
        `when`(recetaRepository.findAllWithDetailsByIdIn(listOf(10L))).thenReturn(listOf(receta))
        `when`(favoritoRepository.findRecetaIdsByUsuarioId(usuarioId)).thenReturn(emptySet())
        `when`(historialRepository.findRecetasByUsuarioId(usuarioId)).thenReturn(emptyList())

        val resultado = service.recomendarRecetas(
            usuarioId,
            RecomendacionRequest(ingredientesExtra = listOf("brocoli"), puedeComprar = true),
            page = -1
        )

        assertEquals(0, resultado.page)
        assertEquals(1, resultado.totalItems)
        assertEquals("Arroz con brocoli", resultado.data.single().receta.nombre)
        assertEquals(setOf("Arroz blanco", "Brócoli"), resultado.data.single().ingredientesCoincidentes)
        assertTrue(resultado.data.single().motivosPositivos.any { it.contains("ingredientes disponibles") })
    }

    @Test
    fun `sugerenciaDiaria usa fallback si no hay candidatas iniciales`() {
        val usuarioId = UUID.randomUUID()
        val arroz = ingredienteFixture(
            id = 1,
            nombre = "Arroz blanco",
            infoNutricional = infoNutricionalFixture(120.0, 3.0, 25.0, 1.0)
        )
        val usuario = usuarioFixture()
        usuario.agregarIngredienteComun(arroz)
        val receta = recetaFixture(id = 20, nombre = "Arroz simple", porciones = 2)
        receta.tiempoEnMinutos = 15
        receta.costoTotalCompra = 3_000.0
        receta.agregarPaso(pasoFixture(1, 15))
        receta.agregarIngrediente(recetaIngredienteFixture(arroz, 200.0))

        `when`(usuarioRepository.findPerfilById(usuarioId)).thenReturn(Optional.of(usuario))
        `when`(
            recetaRepository.findIdsConAlgunIngredienteDisponible(
                listOf(1L),
                listOf(-1L),
                null,
                null,
                PageRequest.of(0, 100)
            )
        ).thenReturn(PageImpl(emptyList<Long>(), PageRequest.of(0, 100), 0))
        `when`(recetaRepository.findAllWithDetailsBy()).thenReturn(listOf(receta))
        `when`(favoritoRepository.findRecetaIdsByUsuarioId(usuarioId)).thenReturn(emptySet())
        `when`(historialRepository.findRecetasByUsuarioId(usuarioId)).thenReturn(emptyList())

        val sugerencia = service.sugerenciaDiaria(usuarioId)

        assertEquals("Arroz simple", sugerencia.receta.nombre)
        assertTrue(sugerencia.motivosPositivos.isNotEmpty())
    }

    @Test
    fun `marca como rapida solo la receta de 20 minutos o menos`() {
        assertTrue(motivosDeSugerenciaCon(tiempoEnMinutos = 15).any { it.startsWith("Receta rápida") })
        assertFalse(motivosDeSugerenciaCon(tiempoEnMinutos = 30).any { it.startsWith("Receta rápida") })
    }

    private fun motivosDeSugerenciaCon(tiempoEnMinutos: Int): List<String> {
        val usuarioId = UUID.randomUUID()
        val arroz = ingredienteFixture(id = 1, nombre = "Arroz blanco")
        val usuario = usuarioFixture()
        usuario.agregarIngredienteComun(arroz)
        val receta = recetaFixture(id = 30, nombre = "Arroz", porciones = 1)
        receta.tiempoEnMinutos = tiempoEnMinutos
        receta.agregarIngrediente(recetaIngredienteFixture(arroz, 100.0))

        `when`(usuarioRepository.findPerfilById(usuarioId)).thenReturn(Optional.of(usuario))
        `when`(
            recetaRepository.findIdsConAlgunIngredienteDisponible(
                listOf(1L),
                listOf(-1L),
                null,
                null,
                PageRequest.of(0, 100)
            )
        ).thenReturn(PageImpl(emptyList<Long>(), PageRequest.of(0, 100), 0))
        `when`(recetaRepository.findAllWithDetailsBy()).thenReturn(listOf(receta))
        `when`(favoritoRepository.findRecetaIdsByUsuarioId(usuarioId)).thenReturn(emptySet())
        `when`(historialRepository.findRecetasByUsuarioId(usuarioId)).thenReturn(emptyList())

        return service.sugerenciaDiaria(usuarioId).motivosPositivos
    }
}
