package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.NivelCocina
import linguini.company.backremyapp.domain.Paso
import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.RecetaIngrediente
import linguini.company.backremyapp.domain.TipoDieta
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.core.annotation.Order
import org.springframework.stereotype.Component

@Component
@Order(3)
class RecetaLoader (
    private val recetaRepository: RecetaRepository,
    private val ingredienteRepository: IngredienteRepository
) : CommandLineRunner {
    override fun run(vararg args: String) {
        val pollo = ingredienteRepository.findById(7).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val arroz = ingredienteRepository.findById(8).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val brocoli = ingredienteRepository.findById(9).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val cebolla = ingredienteRepository.findById(1).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val morron = ingredienteRepository.findById(3).orElseThrow { NotFoundException("Ingrediente no encontrado") }
        val ajo = ingredienteRepository.findById(4).orElseThrow { NotFoundException("Ingrediente no encontrado") }

        val receta1 = Receta(
            nombre = "Arroz con Pollo",
            porciones = 2,
            dificultad = NivelCocina.BASICO,
            tipoDieta = TipoDieta.OMNIVORO
        ).apply {
            descripcion = "Lo mejor para el invierno, ademas es fitness. Que mas queres?"
            imgUrl = "https://images.unsplash.com/photo-1604909052743-94e838986d24"
        }
        receta1.agregarIngrediente(
            RecetaIngrediente(
                ingrediente = pollo,
                cantidad = 500.0,
                unidadMedida = "gramos",
                receta = receta1
            )
        )
        receta1.agregarIngrediente(
            RecetaIngrediente(
                ingrediente = arroz,
                cantidad = 200.0,
                unidadMedida = "gramos",
                receta = receta1
            )
        )

        receta1.agregarPaso(
            Paso(
                orden = 1,
                titulo = "Hervir el arroz",
                descripcion = "Colocar el arroz en agua hirviendo con sal a fuego medio.",
                detalle = "Usar 2 tazas de agua por cada taza de arroz. Tapar la olla y no destapar durante la cocción.",
                tiempoEstimadoMinutos = 15,
                tip = "Lavá el arroz antes de cocinarlo para eliminar el exceso de almidón.",
                imagenUrl = "https://images.unsplash.com/photo-1516684732162-798a0062be99?w=800&q=80",
                receta = receta1
            )
        )
        receta1.agregarPaso(
            Paso(
                orden = 2,
                titulo = "Saltear el pollo",
                descripcion = "Cortar el pollo en cubos y saltear en sartén con aceite a fuego alto.",
                detalle = "Condimentar con sal, pimienta y ajo en polvo. Dorar bien de cada lado para sellar los jugos.",
                tiempoEstimadoMinutos = 10,
                tip = "No muevas el pollo constantemente, dejá que se dore bien antes de girarlo.",
                imagenUrl = "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800&q=80",
                receta = receta1
            )
        )

        recetaRepository.save(receta1)

        val receta2 = Receta(
            nombre = "Wok de Vegetales",
            porciones = 1,
            dificultad = NivelCocina.INTERMEDIO,
            tipoDieta = TipoDieta.VEGANO
        ).apply {
            descripcion = "Vegetales salteados con muchos condimentos de origen natural."
            imgUrl = "https://images.unsplash.com/photo-1512058564366-18510be2db19"
        }
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = brocoli, cantidad = 300.0, unidadMedida = "gramos", receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = cebolla, cantidad = 250.0, unidadMedida = "gramos", receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = ajo, cantidad = 25.0, unidadMedida = "gramos", receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = morron, cantidad = 100.0, unidadMedida = "gramos", receta = receta2))

        receta2.agregarPaso(Paso(
            orden = 1,
            titulo = "Cortar el brócoli",
            descripcion = "Separar el brócoli en ramitos del mismo tamaño.",
            detalle = "Los trozos parejos aseguran una cocción uniforme. Podés blanquearlo 1 minuto en agua hirviendo antes de saltear.",
            tiempoEstimadoMinutos = 5,
            tip = "Usá también el tallo, pelado y cortado fino — tiene el mismo sabor y se desperdicia menos.",
            imagenUrl = "https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=800&q=80",
            receta = receta2
        ))
        receta2.agregarPaso(Paso(
            orden = 2,
            titulo = "Picar cebolla, ajo y morrón",
            descripcion = "Cortar la cebolla en juliana, el morrón en tiras y picar el ajo finamente.",
            detalle = "El corte en juliana permite que los vegetales se cocinen rápido y de forma pareja en el wok.",
            tiempoEstimadoMinutos = 10,
            tip = "Tené todos los vegetales listos antes de encender el fuego — el wok va muy rápido.",
            imagenUrl = "https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=800&q=80",
            receta = receta2
        ))
        receta2.agregarPaso(Paso(
            orden = 3,
            titulo = "Saltear en wok",
            descripcion = "Calentar el wok a fuego fuerte con un hilo de aceite y saltear todos los vegetales.",
            detalle = "Empezar por los más duros (brócoli, morrón) y terminar con los más blandos (cebolla, ajo). Mover constantemente.",
            tiempoEstimadoMinutos = 8,
            tip = "El fuego bien alto es el secreto del wok — si la temperatura baja, los vegetales se cuecen al vapor en lugar de saltearse.",
            imagenUrl = "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800&q=80",
            receta = receta2
        ))

        recetaRepository.save(receta2)

        println("Recetas cargadas en Postgres")
    }
}