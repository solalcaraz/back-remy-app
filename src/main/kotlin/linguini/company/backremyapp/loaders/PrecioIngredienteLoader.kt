package linguini.company.backremyapp.loaders
//
//import linguini.company.backremyapp.domain.PrecioIngrediente
//import linguini.company.backremyapp.domain.UnidadMedida
//import linguini.company.backremyapp.exceptions.NotFoundException
//import linguini.company.backremyapp.repositories.IngredienteRepository
//import linguini.company.backremyapp.repositories.PrecioIngredienteRepository
//import org.springframework.boot.CommandLineRunner
//import org.springframework.core.annotation.Order
//import org.springframework.stereotype.Component
//import java.math.BigDecimal
//
//@Component
//@Order(3)
//class PrecioIngredienteLoader(
//    private val precioIngredienteRepository: PrecioIngredienteRepository,
//    private val ingredienteRepository: IngredienteRepository
//) : CommandLineRunner {
//    override fun run(vararg args: String) {
//        if (precioIngredienteRepository.count() > 0) return
//
//        val precios = listOf(
//            precio("cebolla", "900", 1000.0),
//            precio("queso", "6500", 1000.0),
//            precio("morron", "3200", 1000.0),
//            precio("ajo", "500", 100.0),
//            precio("pimienta", "1200", 100.0),
//            precio("azucar", "1400", 1000.0),
//            precio("pollo", "4200", 1000.0),
//            precio("arroz", "1800", 1000.0),
//            precio("brocoli", "2800", 1000.0),
//            precio("lentejas", "2200", 1000.0),
//            precio("tomate", "1900", 1000.0),
//            precio("huevo", "2800", 12.0, UnidadMedida.UNIDAD),
//            precio("leche", "1300", 1000.0, UnidadMedida.MILILITROS),
//            precio("avena", "2100", 1000.0),
//            precio("aceite de oliva", "8200", 1000.0, UnidadMedida.MILILITROS),
//            precio("papa", "1100", 1000.0),
//            precio("zanahoria", "1200", 1000.0),
//            precio("carne vacuna", "7800", 1000.0),
//            precio("pan rallado", "1700", 1000.0),
//            precio("yogur natural", "1800", 1000.0)
//        )
//
//        precioIngredienteRepository.saveAll(precios)
//        println("Precios de ingredientes cargados en Postgres")
//    }
//
//    private fun precio(
//        nombreIngrediente: String,
//        precio: String,
//        cantidadReferencia: Double,
//        unidadReferencia: UnidadMedida = UnidadMedida.GRAMOS
//    ) = PrecioIngrediente(
//        ingrediente = ingredienteRepository.findByNombre(nombreIngrediente)
//            ?: throw NotFoundException("Ingrediente no encontrado: $nombreIngrediente"),
//        precio = BigDecimal(precio),
//        cantidadReferencia = BigDecimal.valueOf(cantidadReferencia),
//        unidadReferencia = unidadReferencia
//    )
//}
