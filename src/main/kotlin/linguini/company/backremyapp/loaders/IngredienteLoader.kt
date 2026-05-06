package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.Ingrediente
import linguini.company.backremyapp.domain.UnidadMedida
import linguini.company.backremyapp.repositories.IngredienteRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.core.annotation.Order
import org.springframework.stereotype.Component

@Component
@Order(1)
class IngredienteLoader(private val ingredienteRepository: IngredienteRepository) : CommandLineRunner {
    override fun run(vararg args: String) {
        ingredienteRepository.saveAll(listOf(
            // verduras
            Ingrediente(nombre = "cebolla",     unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "ajo",         unidadBase = UnidadMedida.UNIDAD),
            Ingrediente(nombre = "morrón",      unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "tomate",      unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "zanahoria",   unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "papa",        unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "brócoli",     unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "espinaca",    unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "zapallito",   unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "berenjena",   unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "apio",        unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "puerro",      unidadBase = UnidadMedida.GRAMOS),

            // proteínas
            Ingrediente(nombre = "pollo",       unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "carne",       unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "cerdo",       unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "atún",        unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "huevo",       unidadBase = UnidadMedida.UNIDAD),
            Ingrediente(nombre = "lentejas",    unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "garbanzos",   unidadBase = UnidadMedida.GRAMOS),

            // cereales y harinas
            Ingrediente(nombre = "arroz",       unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "pasta",       unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "harina",      unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "pan rallado", unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "avena",       unidadBase = UnidadMedida.GRAMOS),

            // lácteos
            Ingrediente(nombre = "queso",       unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "leche",       unidadBase = UnidadMedida.MILILITROS),
            Ingrediente(nombre = "crema",       unidadBase = UnidadMedida.MILILITROS),
            Ingrediente(nombre = "manteca",     unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "yogur",       unidadBase = UnidadMedida.GRAMOS),

            // condimentos y extras
            Ingrediente(nombre = "sal",         unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "pimienta",    unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "aceite",      unidadBase = UnidadMedida.MILILITROS),
            Ingrediente(nombre = "azúcar",      unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "limón",       unidadBase = UnidadMedida.UNIDAD),
            Ingrediente(nombre = "perejil",     unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "orégano",     unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "pimentón",    unidadBase = UnidadMedida.GRAMOS),
            Ingrediente(nombre = "caldo",       unidadBase = UnidadMedida.MILILITROS),
        ))

        println("Ingredientes cargados")
    }
}