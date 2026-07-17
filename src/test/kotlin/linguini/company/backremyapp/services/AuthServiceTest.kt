package linguini.company.backremyapp.services

import linguini.company.backremyapp.dto.LoginRequest
import linguini.company.backremyapp.dto.RegisterRequest
import linguini.company.backremyapp.exceptions.ConflictException
import linguini.company.backremyapp.exceptions.UnauthorizedException
import linguini.company.backremyapp.repositories.UsuarioRepository
import linguini.company.backremyapp.security.JwtProperties
import linguini.company.backremyapp.security.TokenHelper
import linguini.company.backremyapp.usuarioFixture
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Test
import org.mockito.ArgumentMatchers.any
import org.mockito.Mockito.doThrow
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.mockito.Mockito.`when`
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.crypto.password.PasswordEncoder
import java.util.Date
import java.util.Optional
import java.util.UUID

class AuthServiceTest {
    private val usuarioRepository = mock(UsuarioRepository::class.java)
    private val encoder = mock(PasswordEncoder::class.java)
    private val authManager = mock(AuthenticationManager::class.java)
    private val jwtProperties = JwtProperties(
        key = "12345678901234567890123456789012",
        accessTokenExpiration = 3_600_000,
        refreshTokenExpiration = 86_400_000
    )
    private val tokenHelper = TokenHelper(jwtProperties)
    private val service = AuthService(
        usuarioRepository,
        encoder,
        authManager,
        tokenHelper,
        jwtProperties
    )

    @Test
    fun `register crea usuario con password hasheado si el email no existe`() {
        val request = RegisterRequest("Ana", "ana@remy.app", "admin")
        `when`(usuarioRepository.findByEmail("ana@remy.app")).thenReturn(null)
        `when`(encoder.encode("admin")).thenReturn("hash")
        `when`(usuarioRepository.save(any())).thenAnswer { it.arguments[0] }

        val usuario = service.register(request)

        assertEquals("Ana", usuario.nombre)
        assertEquals("ana@remy.app", usuario.email)
        assertEquals("hash", usuario.password)
        verify(usuarioRepository).save(usuario)
    }

    @Test
    fun `register rechaza email duplicado`() {
        `when`(usuarioRepository.findByEmail("ana@remy.app")).thenReturn(usuarioFixture())

        assertThrows(ConflictException::class.java) {
            service.register(RegisterRequest("Ana", "ana@remy.app", "admin"))
        }
    }

    @Test
    fun `login autentica credenciales y devuelve access y refresh token`() {
        val usuario = usuarioFixture(email = "ana@remy.app")
        usuario.id = UUID.randomUUID()
        `when`(usuarioRepository.findByEmail("ana@remy.app")).thenReturn(usuario)

        val response = service.login(LoginRequest("ana@remy.app", "admin"))

        assertEquals("access", tokenHelper.extractType(response.accessToken))
        assertEquals("refresh", tokenHelper.extractType(response.refreshToken))
        assertEquals(usuario.id, tokenHelper.extractUserId(response.accessToken))
        assertNotNull(response.refreshToken)
    }

    @Test
    fun `login transforma error de autenticacion en unauthorized`() {
        doThrow(RuntimeException("bad credentials")).`when`(authManager)
            .authenticate(any(UsernamePasswordAuthenticationToken::class.java))

        assertThrows(UnauthorizedException::class.java) {
            service.login(LoginRequest("ana@remy.app", "mal"))
        }
    }

    @Test
    fun `refreshToken rechaza token access y acepta refresh vigente`() {
        val usuario = usuarioFixture(email = "ana@remy.app")
        usuario.id = UUID.randomUUID()
        val accessToken = tokenHelper.generateAccessToken(
            usuario,
            Date(System.currentTimeMillis() + 60_000)
        )
        val refreshToken = tokenHelper.generateRefreshToken(
            usuario,
            Date(System.currentTimeMillis() + 60_000)
        )
        `when`(usuarioRepository.findById(usuario.id!!)).thenReturn(Optional.of(usuario))

        assertThrows(UnauthorizedException::class.java) {
            service.refreshToken(accessToken)
        }

        val nuevoAccess = service.refreshToken(refreshToken)

        assertEquals("access", tokenHelper.extractType(nuevoAccess!!))
        assertEquals(usuario.id, tokenHelper.extractUserId(nuevoAccess))
    }
}
