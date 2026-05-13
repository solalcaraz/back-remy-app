package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.Ingrediente
import linguini.company.backremyapp.domain.NivelCocina
import linguini.company.backremyapp.domain.Paso
import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.RecetaIngrediente
import linguini.company.backremyapp.domain.UnidadMedida
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.core.annotation.Order
import org.springframework.stereotype.Component

@Component
@Order(4)
class RecetaLoader(
    private val recetaRepository: RecetaRepository,
    private val ingredienteRepository: IngredienteRepository
) : CommandLineRunner {
    override fun run(vararg args: String) {
        if (recetaRepository.count() > 0) return

        val recetas = listOf(
            arrozConPollo(),
            wokDeVegetales(),
            guisoDeLentejas(),
            omeletteConQueso(),
            avenaConYogur(),
            ensaladaTibiaDePapa(),
            carneConPure(),
            arrozConBrocoli()
        )
        fun ing(nombre: String) = ingredienteRepository.findByNombre(nombre)
            ?: throw NotFoundException("Ingrediente no encontrado: $nombre")

        recetaRepository.saveAll(recetas)
        println("Recetas cargadas en Postgres")
    }

    private fun arrozConPollo() = receta(
        nombre = "Arroz con Pollo",
        porciones = 2,
        dificultad = NivelCocina.BASICO,
        descripcion = "Plato simple, rendidor y alto en proteina.",
        imgUrl = "https://images.unsplash.com/photo-1604909052743-94e838986d24",
        tags = setOf("proteico", "economico"), // En el front tiene que salir también sin gluten
        ingredientes = listOf(
            item("pollo", 500.0),
            item("arroz", 200.0),
            item("cebolla", 120.0),
            item("ajo", 10.0)
        ),
        pasos = listOf(
            paso(1, "Hervir el arroz", "Cocinar el arroz en agua con sal.", 15, "https://images.unsplash.com/photo-1536304929831-ee1ca9d44906"),
            paso(2, "Saltear el pollo", "Dorar el pollo en cubos con cebolla y ajo.", 12, "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d"),
            paso(3, "Unir y servir", "Mezclar arroz y pollo, ajustar condimentos.", 3, "https://images.unsplash.com/photo-1604909052743-94e838986d24")
        )
    )

    private fun wokDeVegetales() = receta(
        nombre = "Wok de Vegetales",
        porciones = 1,
        dificultad = NivelCocina.INTERMEDIO,
        descripcion = "Vegetales salteados, rapido y liviano.",
        imgUrl = "https://images.unsplash.com/photo-1512058564366-18510be2db19",
        tags = setOf("saludable"), // En el front tienen que salir también vegano y sin gluten
        ingredientes = listOf(
            item("brocoli", 300.0),
            item("cebolla", 150.0),
            item("morron", 120.0),
            item("ajo", 8.0),
            item("aceite de oliva", 15.0, UnidadMedida.MILILITROS)
        ),
        pasos = listOf(
            paso(1, "Cortar vegetales", "Separar el brocoli y cortar cebolla y morron.", 10, "https://images.unsplash.com/photo-1583663848850-46af132dc08e"),
            paso(2, "Calentar wok", "Calentar el wok con aceite de oliva.", 2, "https://images.unsplash.com/photo-1585608674996-54522f25fc25"),
            paso(3, "Saltear", "Saltear los vegetales a fuego fuerte.", 8, "https://images.unsplash.com/photo-1512058564366-18510be2db19")
        )
    )

    private fun guisoDeLentejas() = receta(
        nombre = "Guiso de Lentejas",
        porciones = 3,
        dificultad = NivelCocina.INTERMEDIO,
        descripcion = "Guiso vegetal con buena fibra y proteina.",
        imgUrl = "https://images.unsplash.com/photo-1547592166-23ac45744acd",
        tags = setOf("alto en fibra", "economico"), // En el front tienen que salir también vegano
        ingredientes = listOf(
            item("lentejas", 300.0),
            item("tomate", 200.0),
            item("cebolla", 120.0),
            item("zanahoria", 120.0),
            item("papa", 180.0)
        ),
        pasos = listOf(
            paso(1, "Remojar lentejas", "Enjuagar y remojar las lentejas si hace falta.", 5, "https://images.unsplash.com/photo-1620021650702-8ee700c2f826"),
            paso(2, "Sofreir base", "Cocinar cebolla, tomate y zanahoria.", 10, "https://images.unsplash.com/photo-1594964648792-6d2745a557b7"),
            paso(3, "Cocinar guiso", "Agregar lentejas, papa y agua hasta tiernizar.", 35, "https://images.unsplash.com/photo-1547592166-23ac45744acd")
        )
    )

    private fun omeletteConQueso() = receta(
        nombre = "Omelette con Queso",
        porciones = 1,
        dificultad = NivelCocina.BASICO,
        descripcion = "Comida rapida, simple y rica en proteina.",
        imgUrl = "https://images.unsplash.com/photo-1525351484163-7529414344d8",
        tags = setOf("rapido", "proteico"), // En el front tiene que salir también vegetariano
        ingredientes = listOf(
            item("huevo", 2.0, UnidadMedida.UNIDAD),
            item("queso", 60.0),
            item("pimienta", 1.0)
        ),
        pasos = listOf(
            paso(1, "Batir huevos", "Batir huevos con una pizca de pimienta.", 2, "https://images.unsplash.com/photo-1582169296194-e4d644c460ca"),
            paso(2, "Cocinar", "Volcar en sarten caliente y agregar queso.", 6, "https://images.unsplash.com/photo-1601000938259-9e92002320b2"),
            paso(3, "Doblar", "Doblar el omelette y terminar la coccion.", 2, "https://images.unsplash.com/photo-1525351484163-7529414344d8")
        )
    )

    private fun avenaConYogur() = receta(
        nombre = "Avena con Yogur",
        porciones = 1,
        dificultad = NivelCocina.BASICO,
        descripcion = "Desayuno simple, saciante y alto en fibra.",
        imgUrl = "https://images.unsplash.com/photo-1517673132405-a56a62b18caf",
        tags = setOf("desayuno", "fibra", "rapido"),
        ingredientes = listOf(
            item("avena", 60.0),
            item("yogur natural", 160.0),
            item("azucar", 8.0)
        ),
        pasos = listOf(
            paso(1, "Mezclar", "Mezclar avena, yogur y azucar.", 3, "https://images.unsplash.com/photo-1495460596396-039cff98fc86"),
            paso(2, "Reposar", "Dejar reposar para hidratar la avena.", 10, "https://images.unsplash.com/photo-1517673132405-a56a62b18caf")
        )
    )

    private fun ensaladaTibiaDePapa() = receta(
        nombre = "Ensalada Tibia de Papa",
        porciones = 2,
        dificultad = NivelCocina.BASICO,
        descripcion = "Guarnicion economica con vegetales y huevo.",
        imgUrl = "https://images.unsplash.com/photo-1512621776951-a57141f2eefd",
        tags = setOf("economico", "simple"), // En el front tiene que salir también vegetariano
        ingredientes = listOf(
            item("papa", 350.0),
            item("huevo", 2.0, UnidadMedida.UNIDAD),
            item("cebolla", 80.0),
            item("aceite de oliva", 12.0, UnidadMedida.MILILITROS)
        ),
        pasos = listOf(
            paso(1, "Hervir papa", "Cocinar la papa en cubos hasta que este tierna.", 18, "https://images.unsplash.com/photo-1582298538104-12ec82944f38"),
            paso(2, "Hervir huevos", "Cocinar los huevos y pelarlos.", 10, "https://images.unsplash.com/photo-1569263989123-289569cecb36"),
            paso(3, "Armar", "Mezclar papa, huevo, cebolla y aceite.", 4, "https://images.unsplash.com/photo-1512621776951-a57141f2eefd")
        )
    )

    private fun carneConPure() = receta(
        nombre = "Carne con Pure",
        porciones = 2,
        dificultad = NivelCocina.INTERMEDIO,
        descripcion = "Plato clasico, contundente y alto en proteina.",
        imgUrl = "https://images.unsplash.com/photo-1544025162-d76694265947",
        tags = setOf("proteico", "clasico"), // En el front tiene que salir también sin gluten
        ingredientes = listOf(
            item("carne vacuna", 350.0),
            item("papa", 400.0),
            item("leche", 80.0, UnidadMedida.MILILITROS),
            item("ajo", 6.0)
        ),
        pasos = listOf(
            paso(1, "Hervir papas", "Cocinar las papas hasta que esten blandas.", 20, "https://images.unsplash.com/photo-1518977676601-b53f82aba655"),
            paso(2, "Cocinar carne", "Dorar la carne en sarten caliente.", 12, "https://images.unsplash.com/photo-1600891964092-4316c288032e"),
            paso(3, "Pisar pure", "Pisar papa con leche y servir.", 5, "https://images.unsplash.com/photo-1544025162-d76694265947")
        )
    )

    private fun arrozConBrocoli() = receta(
        nombre = "Arroz con Brocoli",
        porciones = 2,
        dificultad = NivelCocina.BASICO,
        descripcion = "Base vegetal barata, liviana y apta para varias restricciones.",
        imgUrl = "https://images.unsplash.com/photo-1603133872878-684f208fb84b",
        tags = setOf("economico"), // En el front tiene que salir también vegano
        ingredientes = listOf(
            item("arroz", 220.0),
            item("brocoli", 220.0),
            item("zanahoria", 90.0),
            item("aceite de oliva", 10.0, UnidadMedida.MILILITROS)
        ),
        pasos = listOf(
            paso(1, "Cocinar arroz", "Hervir el arroz hasta que este a punto.", 15, "https://images.unsplash.com/photo-1536304929831-ee1ca9d44906"),
            paso(2, "Cocinar vegetales", "Saltear brocoli y zanahoria.", 8, "https://images.unsplash.com/photo-1556040220-4096d522378d"),
            paso(3, "Integrar", "Mezclar todo y ajustar condimentos.", 2, "https://images.unsplash.com/photo-1603133872878-684f208fb84b")
        )
    )

    private fun receta(
        nombre: String,
        porciones: Int,
        dificultad: NivelCocina,
        descripcion: String,
        imgUrl: String,
        tags: Set<String>,
        ingredientes: List<RecetaIngrediente>,
        pasos: List<Paso>
    ) = Receta(
        nombre = nombre,
        porciones = porciones,
        dificultad = dificultad,
        tags = tags.toMutableSet()
    ).apply {
        this.descripcion = descripcion
        this.imgUrl = imgUrl
        ingredientes.forEach { agregarIngrediente(it) }
        pasos.forEach { agregarPaso(it) }
    }

    private fun item(
        nombreIngrediente: String,
        cantidad: Double,
        unidad: UnidadMedida = UnidadMedida.GRAMOS
    ) = RecetaIngrediente(
        ingrediente = ingrediente(nombreIngrediente),
        cantidad = cantidad,
        unidadMedida = unidad
    )

    private fun paso(
        orden: Int,
        titulo: String,
        descripcion: String,
        minutos: Int,
        imagenUrl: String? = null
    ) = Paso(
        orden = orden,
        titulo = titulo,
        descripcion = descripcion,
        detalle = descripcion,
        tiempoEstimadoMinutos = minutos,
        tip = null,
        imagenUrl = imagenUrl
    )

    private fun ingrediente(nombre: String): Ingrediente {
        return ingredienteRepository.findByNombre(nombre)
            ?: throw NotFoundException("Ingrediente no encontrado: $nombre")
    }
}