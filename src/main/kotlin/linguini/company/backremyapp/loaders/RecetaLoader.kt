package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.NivelCocina
import linguini.company.backremyapp.domain.Paso
import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.RecetaIngrediente
import linguini.company.backremyapp.domain.TipoDieta
import linguini.company.backremyapp.domain.UnidadMedida
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
        fun ing(nombre: String) = ingredienteRepository.findByNombre(nombre)
            ?: throw NotFoundException("Ingrediente no encontrado: $nombre")

        val receta1 = Receta(
            nombre = "Arroz con Pollo",
            porciones = 2,
            dificultad = NivelCocina.BASICO,
            tipoDieta = TipoDieta.OMNIVORO
        ).apply {
            descripcion = "Lo mejor para el invierno, ademas es fitness. Que mas queres?"
            imgUrl = "https://images.unsplash.com/photo-1604909052743-94e838986d24"
        }
        receta1.agregarIngrediente(RecetaIngrediente(ingrediente = ing("pollo"),   cantidad = 500.0, unidadMedida = UnidadMedida.GRAMOS,    receta = receta1))
        receta1.agregarIngrediente(RecetaIngrediente(ingrediente = ing("arroz"),   cantidad = 200.0, unidadMedida = UnidadMedida.GRAMOS,    receta = receta1))
        receta1.agregarIngrediente(RecetaIngrediente(ingrediente = ing("cebolla"), cantidad = 150.0, unidadMedida = UnidadMedida.GRAMOS,    receta = receta1))
        receta1.agregarIngrediente(RecetaIngrediente(ingrediente = ing("ajo"),     cantidad = 2.0,   unidadMedida = UnidadMedida.UNIDAD,    receta = receta1))
        receta1.agregarIngrediente(RecetaIngrediente(ingrediente = ing("caldo"),   cantidad = 400.0, unidadMedida = UnidadMedida.MILILITROS, receta = receta1))

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
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = ing("brócoli"),   cantidad = 300.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = ing("cebolla"),   cantidad = 200.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = ing("morrón"),    cantidad = 150.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = ing("zanahoria"), cantidad = 100.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = ing("ajo"),       cantidad = 3.0,   unidadMedida = UnidadMedida.UNIDAD, receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = ing("aceite"),    cantidad = 30.0,  unidadMedida = UnidadMedida.MILILITROS, receta = receta2))

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

        val receta3 = Receta(
            nombre = "Tortilla de Papa",
            porciones = 3,
            tipoDieta = TipoDieta.VEGETARIANO
        ).apply {
            descripcion = "El clásico de siempre, con papa y huevo."
            imgUrl = "https://images.unsplash.com/photo-1565299585323-38d6b0865b47"
        }
        receta3.agregarIngrediente(RecetaIngrediente(ingrediente = ing("papa"),    cantidad = 400.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta3))
        receta3.agregarIngrediente(RecetaIngrediente(ingrediente = ing("huevo"),   cantidad = 4.0,   unidadMedida = UnidadMedida.UNIDAD, receta = receta3))
        receta3.agregarIngrediente(RecetaIngrediente(ingrediente = ing("cebolla"), cantidad = 100.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta3))
        receta3.agregarIngrediente(RecetaIngrediente(ingrediente = ing("aceite"),  cantidad = 60.0,  unidadMedida = UnidadMedida.MILILITROS, receta = receta3))
        receta3.agregarIngrediente(RecetaIngrediente(ingrediente = ing("sal"),     cantidad = 5.0,   unidadMedida = UnidadMedida.GRAMOS, receta = receta3))
        receta3.agregarPaso(Paso(orden = 1, titulo = "Pelar y rebanar papas", descripcion = "Cortar las papas en rodajas finas y la cebolla en aros.", detalle = "Grosor de 3-4mm para que se cocinen bien.", tiempoEstimadoMinutos = 10, tip = "Secar las papas con papel para que no salpiquen.", receta = receta3))
        receta3.agregarPaso(Paso(orden = 2, titulo = "Confitar papas", descripcion = "Cocinar papas y cebolla en aceite a fuego bajo hasta tiernizar.", detalle = "No freír — el aceite no debe estar muy caliente.", tiempoEstimadoMinutos = 20, tip = "Las papas tienen que quedar tiernas pero no doradas.", receta = receta3))
        receta3.agregarPaso(Paso(orden = 3, titulo = "Mezclar y cuajar", descripcion = "Escurrir, mezclar con huevos batidos y cuajar en sartén.", detalle = "Dar vuelta con un plato cuando esté firme de abajo.", tiempoEstimadoMinutos = 10, tip = "Sartén antiadherente bien engrasada para dar vuelta fácil.", receta = receta3))
        recetaRepository.save(receta3)

        val receta4 = Receta(
            nombre = "Pasta con Atún",
            porciones = 2,
            tipoDieta = TipoDieta.OMNIVORO
        ).apply {
            descripcion = "Rápida, rendidora y con ingredientes de alacena."
            imgUrl = "https://images.unsplash.com/photo-1563379926898-05f4575a45d8"
        }
        receta4.agregarIngrediente(RecetaIngrediente(ingrediente = ing("pasta"),   cantidad = 250.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta4))
        receta4.agregarIngrediente(RecetaIngrediente(ingrediente = ing("atún"),    cantidad = 180.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta4))
        receta4.agregarIngrediente(RecetaIngrediente(ingrediente = ing("tomate"),  cantidad = 200.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta4))
        receta4.agregarIngrediente(RecetaIngrediente(ingrediente = ing("ajo"),     cantidad = 2.0,   unidadMedida = UnidadMedida.UNIDAD, receta = receta4))
        receta4.agregarIngrediente(RecetaIngrediente(ingrediente = ing("aceite"),  cantidad = 20.0,  unidadMedida = UnidadMedida.MILILITROS, receta = receta4))
        receta4.agregarIngrediente(RecetaIngrediente(ingrediente = ing("orégano"), cantidad = 3.0,   unidadMedida = UnidadMedida.GRAMOS, receta = receta4))
        receta4.agregarPaso(Paso(orden = 1, titulo = "Hervir la pasta", descripcion = "Cocinar la pasta en agua con sal según el paquete.", detalle = "Guardar media taza del agua de cocción para la salsa.", tiempoEstimadoMinutos = 10, tip = "Al dente queda mejor con la salsa.", receta = receta4))
        receta4.agregarPaso(Paso(orden = 2, titulo = "Salsa de tomate y atún", descripcion = "Saltear ajo, agregar tomate y cocinar 5 min, incorporar atún.", detalle = "El atún se agrega al final para que no se seque.", tiempoEstimadoMinutos = 8, tip = "Un poco del agua de la pasta ayuda a ligar la salsa.", receta = receta4))
        recetaRepository.save(receta4)

        val receta5 = Receta(
            nombre = "Guiso de Lentejas",
            porciones = 4,
            tipoDieta = TipoDieta.VEGANO
        ).apply {
            descripcion = "Nutritivas, baratas y reconfortantes para el invierno."
            imgUrl = "https://images.unsplash.com/photo-1547592180-85f173990554"
        }
        receta5.agregarIngrediente(RecetaIngrediente(ingrediente = ing("lentejas"),  cantidad = 300.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta5))
        receta5.agregarIngrediente(RecetaIngrediente(ingrediente = ing("cebolla"),   cantidad = 200.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta5))
        receta5.agregarIngrediente(RecetaIngrediente(ingrediente = ing("zanahoria"), cantidad = 150.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta5))
        receta5.agregarIngrediente(RecetaIngrediente(ingrediente = ing("tomate"),    cantidad = 200.0, unidadMedida = UnidadMedida.GRAMOS, receta = receta5))
        receta5.agregarIngrediente(RecetaIngrediente(ingrediente = ing("ajo"),       cantidad = 3.0,   unidadMedida = UnidadMedida.UNIDAD, receta = receta5))
        receta5.agregarIngrediente(RecetaIngrediente(ingrediente = ing("pimentón"),  cantidad = 5.0,   unidadMedida = UnidadMedida.GRAMOS, receta = receta5))
        receta5.agregarIngrediente(RecetaIngrediente(ingrediente = ing("caldo"),     cantidad = 600.0, unidadMedida = UnidadMedida.MILILITROS, receta = receta5))
        receta5.agregarPaso(Paso(orden = 1, titulo = "Remojar lentejas", descripcion = "Dejar en agua fría al menos 2 horas antes.", detalle = "Reduce el tiempo de cocción y mejora la digestión.", tiempoEstimadoMinutos = 120, tip = "Si son lentejas turcas no hace falta remojar.", receta = receta5))
        receta5.agregarPaso(Paso(orden = 2, titulo = "Sofrito base", descripcion = "Rehogar cebolla, ajo, zanahoria y tomate con pimentón.", detalle = "Cocinar hasta que la cebolla esté transparente.", tiempoEstimadoMinutos = 10, tip = "El pimentón se agrega con el fuego apagado para no amargar.", receta = receta5))
        receta5.agregarPaso(Paso(orden = 3, titulo = "Cocción final", descripcion = "Agregar lentejas escurridas y caldo, cocinar a fuego bajo.", detalle = "45 min aprox hasta que estén tiernas.", tiempoEstimadoMinutos = 45, tip = "Ajustar sal recién al final.", receta = receta5))
        recetaRepository.save(receta5)

        println("Recetas cargadas en Postgres")
    }
}