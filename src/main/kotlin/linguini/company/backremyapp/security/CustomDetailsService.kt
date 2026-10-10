package linguini.company.backremyapp.security

import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.security.core.userdetails.User
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Service

@Service
class CustomUserDetailsService(
    private val usuarioRepository: UsuarioRepository
) : UserDetailsService {
    override fun loadUserByUsername(username: String): UserDetails =
        usuarioRepository.findByEmail(username)
            ?.mapToUserDetails()
            ?: throw UsernameNotFoundException("User not found")

    private fun Usuario.mapToUserDetails(): UserDetails =
        User.builder()
            // El login busca por email, pero el username interno es el id: así authentication.name identifica al usuario.
            .username(this.id.toString())
            .password(this.password)
            .roles("USER")
            .build()
}