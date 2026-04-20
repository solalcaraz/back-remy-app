package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.Ingrediente
import linguini.company.backremyapp.repositories.IngredienteRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.core.annotation.Order
import org.springframework.stereotype.Component

@Component
@Order(1)
class IngredienteLoader(private val ingredienteRepository: IngredienteRepository) : CommandLineRunner {
    override fun run(vararg args: String) {
        ingredienteRepository.save(Ingrediente(nombre = "Cebolla"))
        ingredienteRepository.save(Ingrediente(nombre = "Queso"))
        ingredienteRepository.save(Ingrediente(nombre = "Morrón"))
        ingredienteRepository.save(Ingrediente(nombre = "Ajo"))
        ingredienteRepository.save(Ingrediente(nombre = "Pimienta"))
        ingredienteRepository.save(Ingrediente(nombre = "Azúcar"))
    }
}