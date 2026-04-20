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
        ingredienteRepository.save(Ingrediente(nombre = "cebolla"))
        ingredienteRepository.save(Ingrediente(nombre = "queso"))
        ingredienteRepository.save(Ingrediente(nombre = "morrón"))
        ingredienteRepository.save(Ingrediente(nombre = "ajo"))
        ingredienteRepository.save(Ingrediente(nombre = "pimienta"))
        ingredienteRepository.save(Ingrediente(nombre = "azúcar"))
    }
}