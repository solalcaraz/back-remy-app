package linguini.company.backremyapp.services

import linguini.company.backremyapp.dto.UsuarioPatchRequest
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.helpers.UsuarioMapper
import linguini.company.backremyapp.ingredienteFixture
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.RestriccionAlimentariaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import linguini.company.backremyapp.restriccionFixture
import linguini.company.backremyapp.usuarioFixture
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Test
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.mockito.Mockito.`when`
import org.springframework.mock.web.MockMultipartFile
import java.util.Optional
import java.util.UUID

class UsuarioServiceTest {
    private val usuarioRepository = mock(UsuarioRepository::class.java)
    private val mapper = UsuarioMapper("http://localhost:9000")
    private val fileStorageService = mock(FileStorageService::class.java)
    private val ingredienteRepository = mock(IngredienteRepository::class.java)
    private val restriccionRepository = mock(RestriccionAlimentariaRepository::class.java)
    private val service = UsuarioService(
        usuarioRepository,
        mapper,
        fileStorageService,
        ingredienteRepository,
        restriccionRepository,
        "http://localhost:9000"
    )

    @Test
    fun `updateUsuario actualiza perfil restricciones y preferencias`() {
        val usuarioId = UUID.randomUUID()
        val usuario = usuarioFixture()
        val vegano = restriccionFixture(1, "vegano")
        val arroz = ingredienteFixture(1, "Arroz blanco")
        val leche = ingredienteFixture(2, "Leche entera")
        `when`(usuarioRepository.findPerfilById(usuarioId)).thenReturn(Optional.of(usuario))
        `when`(restriccionRepository.findByNombreNormalizadoIn(listOf("vegano"))).thenReturn(listOf(vegano))
        `when`(ingredienteRepository.findByNombreNormalizadoIn(listOf("arroz blanco", "leche entera")))
            .thenReturn(listOf(arroz, leche))

        service.updateUsuario(
            usuarioId,
            UsuarioPatchRequest(
                nombre = "Ana",
                foto = "/foto.jpg",
                restriccionesAlimentarias = setOf("Vegano"),
                objetivo = "Ganar masa muscular",
                nivelCocina = "Avanzado",
                perfilEconomico = "Flexible",
                ingredientesComunes = setOf(" Arroz blanco ", "arroz blanco"),
                ingredientesAEvitar = setOf("Leche entera")
            )
        )

        assertEquals("Ana", usuario.nombre)
        assertEquals(setOf(vegano), usuario.restriccionesAlimentarias)
        assertEquals(setOf(arroz), usuario.ingredientesComunes())
        assertEquals(setOf(leche), usuario.ingredientesAEvitar())
        verify(usuarioRepository).save(usuario)
    }

    @Test
    fun `updateUsuario limpia restricciones y preferencias cuando vienen nulas o vacias`() {
        val usuarioId = UUID.randomUUID()
        val usuario = usuarioFixture()
        usuario.cambiarRestriccionesAlimentarias(listOf(restriccionFixture(1, "vegano")))
        usuario.agregarIngredienteComun(ingredienteFixture(1, "Arroz"))
        `when`(usuarioRepository.findPerfilById(usuarioId)).thenReturn(Optional.of(usuario))

        service.updateUsuario(
            usuarioId,
            UsuarioPatchRequest(
                nombre = "Usuario",
                foto = null,
                restriccionesAlimentarias = null,
                objetivo = "Indiferente",
                nivelCocina = "Basico",
                perfilEconomico = "Intermedio",
                ingredientesComunes = emptySet(),
                ingredientesAEvitar = null
            )
        )

        assertEquals(emptySet<Any>(), usuario.restriccionesAlimentarias)
        assertEquals(emptySet<Any>(), usuario.preferenciasIngredientes)
    }

    @Test
    fun `updateUsuario falla cuando falta una restriccion o ingrediente`() {
        val usuarioId = UUID.randomUUID()
        val usuario = usuarioFixture()
        `when`(usuarioRepository.findPerfilById(usuarioId)).thenReturn(Optional.of(usuario))
        `when`(restriccionRepository.findByNombreNormalizadoIn(listOf("sin_mariscos"))).thenReturn(emptyList())

        assertThrows(NotFoundException::class.java) {
            service.updateUsuario(
                usuarioId,
                UsuarioPatchRequest(
                    nombre = "Usuario",
                    foto = null,
                    restriccionesAlimentarias = setOf("sin_mariscos"),
                    objetivo = "Indiferente",
                    nivelCocina = "Basico",
                    perfilEconomico = "Intermedio",
                    ingredientesComunes = emptySet(),
                    ingredientesAEvitar = emptySet()
                )
            )
        }
    }

    @Test
    fun `updateFotoUsuario guarda archivo y devuelve url absoluta`() {
        val usuarioId = UUID.randomUUID()
        val usuario = usuarioFixture()
        val foto = MockMultipartFile("foto", "foto.jpg", "image/jpeg", byteArrayOf(1, 2, 3))
        `when`(usuarioRepository.findById(usuarioId)).thenReturn(Optional.of(usuario))
        `when`(fileStorageService.guardarFotoUsuario(usuarioId, foto))
            .thenReturn("/uploads/usuarios/foto.jpg")

        val response = service.updateFotoUsuario(usuarioId, foto)

        assertEquals("/uploads/usuarios/foto.jpg", usuario.fotoUrl)
        assertEquals("http://localhost:9000/uploads/usuarios/foto.jpg", response.foto)
    }

    @Test
    fun `getUsuarioById lanza not found si no existe`() {
        val usuarioId = UUID.randomUUID()
        `when`(usuarioRepository.findPerfilById(usuarioId)).thenReturn(Optional.empty())

        assertThrows(NotFoundException::class.java) {
            service.getUsuarioById(usuarioId)
        }
    }
}
