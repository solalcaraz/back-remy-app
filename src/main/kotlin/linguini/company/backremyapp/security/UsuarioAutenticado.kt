package linguini.company.backremyapp.security

import org.springframework.security.core.context.SecurityContextHolder
import java.util.UUID

// CustomUserDetailsService usa el id del usuario como username, así que el nombre de la autenticación es su UUID.
fun usuarioAutenticadoId(): UUID =
    UUID.fromString(SecurityContextHolder.getContext().authentication?.name.toString())
