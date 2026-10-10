package linguini.company.backremyapp.security

import io.jsonwebtoken.ExpiredJwtException
import io.jsonwebtoken.JwtException
import jakarta.servlet.FilterChain
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource
import org.springframework.stereotype.Component
import org.springframework.web.filter.OncePerRequestFilter

/* Esto sería como un middleware de node. Establece como tiene que actuar el security filter
y delega al siguiente eslabón de la filter chain. */
@Component
class JwtAuthenticationFilter(
    private val userDetailsService: CustomUserDetailsService,
    private val tokenHelper: TokenHelper,
    private val usuarioRepository: UsuarioRepository
) : OncePerRequestFilter() {

    override fun doFilterInternal(
        request: HttpServletRequest,
        response: HttpServletResponse,
        filterChain: FilterChain
    ) {
        try {
            val authHeader: String? = request.getHeader("Authorization")

            if (authHeader.doesNotContainBearerToken()) {
                filterChain.doFilter(request, response)
                return
            }

            val jwtToken = authHeader!!.extractTokenValue()
            val userId = tokenHelper.extractUserId(jwtToken)

            if (userId == null) {
                writeUnauthorizedResponse(response, "Invalid token", "El token no es valido")
                return
            }

            if (SecurityContextHolder.getContext().authentication == null) {
                val usuario = usuarioRepository.findById(userId)
                    .orElseThrow { NotFoundException("Usuario no encontrado") }

                val foundUser = userDetailsService.loadUserByUsername(usuario.email)

                if (tokenHelper.isValid(jwtToken, usuario.id!!)) {
                    updateContext(foundUser, request)
                }
            }

            filterChain.doFilter(request, response)
        } catch (e: ExpiredJwtException) {
            // Captura la excepción de token expirado y devuelve el status code adecuado (401-Unauthorized)
            logger.warn(e.message)
            writeUnauthorizedResponse(response, "Token expired", e.message ?: "El token expiro")
        } catch (e: JwtException) {
            logger.warn(e.message)
            writeUnauthorizedResponse(response, "Invalid token", e.message ?: "El token no es valido")
        } catch (e: NotFoundException) {
            logger.warn(e.message)
            writeUnauthorizedResponse(response, "Invalid token", e.message ?: "Usuario no encontrado")
        }

    }

    private fun writeUnauthorizedResponse(
        response: HttpServletResponse,
        error: String,
        message: String
    ) {
        SecurityContextHolder.clearContext()
        response.status = HttpServletResponse.SC_UNAUTHORIZED
        response.contentType = "application/json"
        response.characterEncoding = "UTF-8"
        response.writer.write("{\"error\":\"${error.escapeJson()}\",\"message\":\"${message.escapeJson()}\"}")
    }

    private fun updateContext(foundUser: UserDetails, request: HttpServletRequest) {
        val authToken = UsernamePasswordAuthenticationToken(foundUser, null, foundUser.authorities)
        authToken.details = WebAuthenticationDetailsSource().buildDetails(request)

        SecurityContextHolder.getContext().authentication = authToken
    }

    /* Si el token expira, debería poder loguear de nuevo y no recibir 401, por eso salto el filter
    tanto para login como register como /refresh más adelante */
    override fun shouldNotFilter(request: HttpServletRequest): Boolean {
        val path = request.servletPath
        return path.startsWith("/auth/")
    }

    private fun String?.doesNotContainBearerToken(): Boolean =
        this == null || !this.startsWith("Bearer ")

    private fun String.extractTokenValue(): String =
        this.substringAfter("Bearer ")

    private fun String.escapeJson(): String =
        this.replace("\\", "\\\\").replace("\"", "\\\"")
}
