package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.InfoNutricional
import linguini.company.backremyapp.domain.Ingrediente
import linguini.company.backremyapp.domain.RestriccionAlimentaria
import linguini.company.backremyapp.domain.UnidadMedida
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.RestriccionAlimentariaRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.core.annotation.Order
import org.springframework.stereotype.Component

@Component
@Order(1)
class IngredienteLoader(
    private val ingredienteRepository: IngredienteRepository,
    private val restriccionAlimentariaRepository: RestriccionAlimentariaRepository
) : CommandLineRunner {
    override fun run(vararg args: String) {
        if (ingredienteRepository.count() > 0) return

        val vegetariano = restriccion("Vegetariano")
        val vegano = restriccion("Vegano")
        val sinGluten = restriccion("Sin gluten")
        val sinLactosa = restriccion("Sin lactosa")
        val bajoSodio = restriccion("Bajo sodio")

        fun vegetal() = mutableSetOf(vegetariano, vegano, sinGluten, sinLactosa, bajoSodio)
        fun animalSinGluten() = mutableSetOf(sinGluten, sinLactosa)
        fun lacteo() = mutableSetOf(vegetariano, sinGluten)

        val ingredientes = listOf(
            ingrediente("cebolla", UnidadMedida.GRAMOS, vegetal(), info(40.0, 1.1, 9.3, 0.1, 1.7)),
            ingrediente("queso", UnidadMedida.GRAMOS, lacteo(), info(350.0, 25.0, 1.3, 27.0, 0.0)),
            ingrediente("morron", UnidadMedida.GRAMOS, vegetal(), info(31.0, 1.0, 6.0, 0.3, 2.1)),
            ingrediente("ajo", UnidadMedida.GRAMOS, vegetal(), info(149.0, 6.4, 33.0, 0.5, 2.1)),
            ingrediente("pimienta", UnidadMedida.GRAMOS, vegetal(), info(251.0, 10.0, 64.0, 3.3, 25.0)),
            ingrediente("azucar", UnidadMedida.GRAMOS, mutableSetOf(vegetariano, vegano, sinGluten, sinLactosa), info(387.0, 0.0, 100.0, 0.0, 0.0)),
            ingrediente("pollo", UnidadMedida.GRAMOS, animalSinGluten(), info(165.0, 31.0, 0.0, 3.6, 0.0)),
            ingrediente("arroz", UnidadMedida.GRAMOS, vegetal(), info(130.0, 2.7, 28.0, 0.3, 0.4)),
            ingrediente("brocoli", UnidadMedida.GRAMOS, vegetal(), info(34.0, 2.8, 6.6, 0.4, 2.6)),
            ingrediente("lentejas", UnidadMedida.GRAMOS, vegetal(), info(116.0, 9.0, 20.0, 0.4, 7.9)),
            ingrediente("tomate", UnidadMedida.GRAMOS, vegetal(), info(18.0, 0.9, 3.9, 0.2, 1.2)),
            ingrediente("huevo", UnidadMedida.UNIDAD, mutableSetOf(vegetariano, sinGluten, sinLactosa), info(72.0, 6.3, 0.4, 5.0, 0.0, 1.0, UnidadMedida.UNIDAD)),
            ingrediente("leche", UnidadMedida.MILILITROS, mutableSetOf(vegetariano, sinGluten), info(61.0, 3.2, 4.8, 3.3, 0.0, 100.0, UnidadMedida.MILILITROS)),
            ingrediente("avena", UnidadMedida.GRAMOS, mutableSetOf(vegetariano, vegano, sinLactosa), info(389.0, 16.9, 66.0, 6.9, 10.6)),
            ingrediente("aceite de oliva", UnidadMedida.MILILITROS, mutableSetOf(vegetariano, vegano, sinGluten, sinLactosa), info(884.0, 0.0, 0.0, 100.0, 0.0, 100.0, UnidadMedida.MILILITROS)),
            ingrediente("papa", UnidadMedida.GRAMOS, vegetal(), info(77.0, 2.0, 17.0, 0.1, 2.2)),
            ingrediente("zanahoria", UnidadMedida.GRAMOS, vegetal(), info(41.0, 0.9, 10.0, 0.2, 2.8)),
            ingrediente("carne vacuna", UnidadMedida.GRAMOS, animalSinGluten(), info(250.0, 26.0, 0.0, 15.0, 0.0)),
            ingrediente("pan rallado", UnidadMedida.GRAMOS, mutableSetOf(vegetariano, vegano, sinLactosa), info(395.0, 13.0, 72.0, 5.0, 4.5)),
            ingrediente("yogur natural", UnidadMedida.GRAMOS, mutableSetOf(vegetariano, sinGluten), info(61.0, 3.5, 4.7, 3.3, 0.0))
        )

        ingredienteRepository.saveAll(ingredientes)
        println("Ingredientes y restricciones cargados en Postgres")
    }
        /*ingredienteRepository.saveAll(listOf(
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

    println("Ingredientes cargados")  */


    private fun restriccion(nombre: String): RestriccionAlimentaria {
        return restriccionAlimentariaRepository.findByNombre(nombre)
            ?: restriccionAlimentariaRepository.save(RestriccionAlimentaria(nombre = nombre))

    }

    private fun info(
        calorias: Double,
        proteinas: Double,
        carbohidratos: Double,
        grasas: Double,
        fibra: Double,
        cantidadReferencia: Double = 100.0,
        unidadReferencia: UnidadMedida = UnidadMedida.GRAMOS
    ) = InfoNutricional(
        calorias = calorias,
        proteinas = proteinas,
        carbohidratos = carbohidratos,
        grasas = grasas,
        fibra = fibra,
        cantidadReferencia = cantidadReferencia,
        unidadReferencia = unidadReferencia
    )

    private fun ingrediente(
        nombre: String,
        unidadBase: UnidadMedida,
        restricciones: MutableSet<RestriccionAlimentaria>,
        infoNutricional: InfoNutricional
    ) = Ingrediente(
        nombre = nombre,
        unidadBase = unidadBase,
        restriccionesAlimentarias = restricciones,
        infoNutricional = infoNutricional
    )
}
