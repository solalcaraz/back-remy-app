package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.AuthenticationResponse
import linguini.company.backremyapp.dto.LoginRequest
import linguini.company.backremyapp.dto.RegisterRequest
import linguini.company.backremyapp.exceptions.ConflictException
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.exceptions.UnauthorizedException
import linguini.company.backremyapp.repositories.UsuarioRepository
import linguini.company.backremyapp.security.JwtProperties
import linguini.company.backremyapp.security.TokenHelper
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.util.Date

@Service
class AuthService(
    private val usuarioRepository: UsuarioRepository,
    private val encoder: PasswordEncoder,
    private val authManager: AuthenticationManager,
    private val tokenHelper: TokenHelper,
    private val jwtProperties: JwtProperties
) {
    fun login(request: LoginRequest): AuthenticationResponse {
        // Delega en Spring Security la verificación de credenciales.
        // Internamente llama a CustomUserDetailsService.loadUserByUsername
        // y compara el password con BCrypt.
        // Si falla lanza una excepción que capturamos para devolver 401.
        try {
            authManager.authenticate(
                UsernamePasswordAuthenticationToken(request.email, request.password)
            )
        } catch (_: Exception) {
            throw UnauthorizedException("El usuario o la contraseña son inválidos")
        }

        val usuario = usuarioRepository.findByEmail(request.email)
            ?: throw NotFoundException("Usuario no encontrado")

        return buildAuthResponse(usuario)
    }

    @Transactional
    fun register(request: RegisterRequest): Usuario {
        if (usuarioRepository.findByEmail(request.email) != null) {
            throw ConflictException("Ya existe una cuenta con ese email")
        }

        val nuevoUsuario = Usuario(
            nombre = request.nombre,
            email = request.email,
            password = encoder.encode(request.password)!!
        )

        return usuarioRepository.save(nuevoUsuario)
    }

    fun refreshToken(token: String): String? {
        if (tokenHelper.isExpired(token)) {
            throw UnauthorizedException("Refresh token expirado")
        }
        if (tokenHelper.extractType(token) != "refresh") {
            throw UnauthorizedException("El token proporcionado no es un refresh token")
        }

        val userId = tokenHelper.extractUserId(token)
            ?: throw UnauthorizedException("Refresh token inválido")

        val usuario = usuarioRepository.findById(userId)
            .orElseThrow { UnauthorizedException("Usuario no encontrado") }

        return tokenHelper.generateAccessToken(
            usuario,
            expirationDate = Date(System.currentTimeMillis() + jwtProperties.accessTokenExpiration)
        )
    }

    private fun buildAuthResponse(usuario: Usuario): AuthenticationResponse {
        val accessToken = tokenHelper.generateAccessToken(
            usuario,
            expirationDate = Date(System.currentTimeMillis() + jwtProperties.accessTokenExpiration)
        )
        val refreshToken = tokenHelper.generateRefreshToken(
            usuario,
            expirationDate = Date(System.currentTimeMillis() + jwtProperties.refreshTokenExpiration)
        )
        return AuthenticationResponse(accessToken = accessToken, refreshToken = refreshToken)
    }
}