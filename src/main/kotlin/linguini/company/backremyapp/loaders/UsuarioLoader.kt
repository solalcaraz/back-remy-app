package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.core.annotation.Order
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Component
import java.util.UUID

@Component
@Order(2)
class UsuarioLoader(
    private val usuarioRepository: UsuarioRepository,
    private val ingredienteRepository: IngredienteRepository,
    private val encoder: PasswordEncoder
) : CommandLineRunner {
    override fun run(vararg args: String) {
        val ingrediente1 =
            ingredienteRepository.findById(1).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val ingrediente2 =
            ingredienteRepository.findById(2).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val ingrediente3 =
            ingredienteRepository.findById(3).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val ingrediente4 =
            ingredienteRepository.findById(4).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val ingrediente5 =
            ingredienteRepository.findById(5).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val ingrediente6 =
            ingredienteRepository.findById(6).orElseThrow { NotFoundException("Ingrediente no encontrado") }

        val usuario = Usuario(
            nombre = "Diego Maradona",
            email = "diego@maradona.com",
            password = encoder.encode("admin")!!
        ).apply {
            agregarIngredienteComun(ingrediente1)
            agregarIngredienteComun(ingrediente2)
            agregarIngredienteComun(ingrediente3)
            agregarIngredienteComun(ingrediente4)
            agregarIngredienteAEvitar(ingrediente5)
            agregarIngredienteAEvitar(ingrediente6)
        }

        usuarioRepository.save(usuario)
        println("Usuarios cargados en Postgres")
    }
}