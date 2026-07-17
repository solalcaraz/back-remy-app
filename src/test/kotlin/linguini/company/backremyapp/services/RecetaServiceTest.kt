package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.FavoritoReceta
import linguini.company.backremyapp.domain.HistorialReceta
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.recetaFixture
import linguini.company.backremyapp.repositories.FavoritoRecetaRepository
import linguini.company.backremyapp.repositories.HistorialRecetaRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import linguini.company.backremyapp.usuarioFixture
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Test
import org.mockito.ArgumentMatchers.any
import org.mockito.Mockito.mock
import org.mockito.Mockito.never
import org.mockito.Mockito.verify
import org.mockito.Mockito.`when`
import org.springframework.data.domain.PageRequest
import java.util.Optional
import java.util.UUID

class RecetaServiceTest {
    private val recetaRepository = mock(RecetaRepository::class.java)
    private val usuarioRepository = mock(UsuarioRepository::class.java)
    private val historialRepository = mock(HistorialRecetaRepository::class.java)
    private val favoritoRepository = mock(FavoritoRecetaRepository::class.java)
    private val service = RecetaService(
        recetaRepository,
        usuarioRepository,
        historialRepository,
        favoritoRepository
    )

    @Test
    fun `getRecetaCompletaById devuelve receta o lanza not found`() {
        val receta = recetaFixture(id = 10)
        `when`(recetaRepository.findWithDetailsById(10)).thenReturn(Optional.of(receta))
        `when`(recetaRepository.findWithDetailsById(99)).thenReturn(Optional.empty())

        assertEquals(receta, service.getRecetaCompletaById(10))
        assertThrows(NotFoundException::class.java) {
            service.getRecetaCompletaById(99)
        }
    }

    @Test
    fun `sugerirRecetasPorNombre ignora busquedas cortas y normaliza limite`() {
        val receta = recetaFixture(nombre = "Arroz con pollo")
        `when`(
            recetaRepository.findByNombreContainingIgnoreCaseOrderByNombreAsc(
                "arroz",
                PageRequest.of(0, 8)
            )
        ).thenReturn(listOf(receta))

        assertEquals(emptyList<Any>(), service.sugerirRecetasPorNombre(" a ", 5))
        assertEquals(listOf(receta), service.sugerirRecetasPorNombre(" arroz ", 99))
    }

    @Test
    fun `getHistorial y getFavoritos verifican existencia del usuario`() {
        val usuarioId = UUID.randomUUID()
        val receta = recetaFixture(id = 1)
        `when`(usuarioRepository.existsById(usuarioId)).thenReturn(true)
        `when`(historialRepository.findHistorialWithRecetaTagsByUsuarioId(usuarioId))
            .thenReturn(listOf(HistorialReceta(usuario = usuarioFixture(), receta = receta)))
        `when`(favoritoRepository.findFavoritosWithRecetaTagsByUsuarioId(usuarioId))
            .thenReturn(listOf(FavoritoReceta(usuario = usuarioFixture(), receta = receta)))

        assertEquals(listOf(receta), service.getHistorial(usuarioId))
        assertEquals(listOf(receta), service.getFavoritos(usuarioId))

        val inexistente = UUID.randomUUID()
        `when`(usuarioRepository.existsById(inexistente)).thenReturn(false)

        assertThrows(NotFoundException::class.java) {
            service.getFavoritos(inexistente)
        }
    }

    @Test
    fun `agregarFavorito guarda usuario con favorito y evita duplicados desde el dominio`() {
        val usuarioId = UUID.randomUUID()
        val receta = recetaFixture(id = 5)
        val usuario = usuarioFixture()
        `when`(usuarioRepository.findWithFavoritosById(usuarioId)).thenReturn(Optional.of(usuario))
        `when`(recetaRepository.findById(5)).thenReturn(Optional.of(receta))

        service.agregarFavorito(usuarioId, 5)
        service.agregarFavorito(usuarioId, 5)

        assertEquals(1, usuario.favoritos.size)
        verify(usuarioRepository, org.mockito.Mockito.times(2)).save(usuario)
    }

    @Test
    fun `eliminarFavorito falla si la receta no estaba en favoritos`() {
        val usuarioId = UUID.randomUUID()
        val usuario = usuarioFixture()
        val receta = recetaFixture(id = 5)
        `when`(usuarioRepository.findWithFavoritosById(usuarioId)).thenReturn(Optional.of(usuario))
        `when`(recetaRepository.findById(5)).thenReturn(Optional.of(receta))

        assertThrows(NotFoundException::class.java) {
            service.eliminarFavorito(usuarioId, 5)
        }
        verify(usuarioRepository, never()).save(any())
    }
}
