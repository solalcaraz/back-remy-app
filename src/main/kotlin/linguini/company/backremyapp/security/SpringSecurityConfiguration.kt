package linguini.company.backremyapp.security

import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.security.authentication.dao.DaoAuthenticationProvider
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder

/* Este archivo le dice a spring security con qué configuraciones se va a trabajar,
Define cómo Spring debe cargar usuarios desde la base (UserDetailsService),
cómo debe verificar contraseñas (PasswordEncoder), qué estrategia concreta usará para
autenticar credenciales username/password (DaoAuthenticationProvider)
y expone el AuthenticationManager, que delega la autenticación en los providers configurados.
También registra JwtProperties para leer la configuración externa del JWT. */

@Configuration
@EnableConfigurationProperties(JwtProperties::class)
class SpringSecurityConfiguration {
    @Bean
    fun userDetailsService(usuarioRepository: UsuarioRepository): UserDetailsService =
        CustomUserDetailsService(usuarioRepository)

    @Bean
    fun encoder(): PasswordEncoder = BCryptPasswordEncoder()

    //Es diferente al de PHM porque la version 7 de SB elimino la manera de usasr esta funcion de mierda
    @Bean
    fun authenticationProvider(
        usuarioRepository: UsuarioRepository
    ): AuthenticationProvider {

        val authProvider = DaoAuthenticationProvider()

        authProvider.setUserDetailsService(
            userDetailsService(usuarioRepository)
        )

        authProvider.setPasswordEncoder(
            encoder()
        )

        return authProvider
    }

    @Bean
    fun authenticationManager(config: AuthenticationConfiguration): AuthenticationManager =
        config.authenticationManager
}