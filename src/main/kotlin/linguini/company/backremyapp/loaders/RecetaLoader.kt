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
        )
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
                titulo = "Hervir",
                descripcion = "Hervir el arroz",
                tiempoEstimadoMinutos = 15,
                receta = receta1
            )
        )
        receta1.agregarPaso(
            Paso(
                orden = 2,
                titulo = "Cocinar",
                descripcion = "Saltear el pollo",
                tiempoEstimadoMinutos = 10,
                receta = receta1
            )
        )

        recetaRepository.save(receta1)

        val receta2 = Receta(nombre = "Wok de Vegetales", porciones = 1, dificultad = NivelCocina.INTERMEDIO, tipoDieta = TipoDieta.VEGANO)
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = brocoli, cantidad = 300.0, unidadMedida = "gramos", receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = cebolla, cantidad = 250.0, unidadMedida = "gramos", receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = ajo, cantidad = 25.0, unidadMedida = "gramos", receta = receta2))
        receta2.agregarIngrediente(RecetaIngrediente(ingrediente = morron, cantidad = 100.0, unidadMedida = "gramos", receta = receta2))

        receta2.agregarPaso(Paso(orden = 1, titulo = "Cortar", descripcion = "Cortar brócoli", tiempoEstimadoMinutos = 5, receta = receta2))
        receta2.agregarPaso(Paso(orden = 2, titulo = "Picar", descripcion = "Picar cebolla, ajo y morrón", tiempoEstimadoMinutos = 10, receta = receta2))
        receta2.agregarPaso(Paso(orden = 3, titulo = "Saltear", descripcion = "Saltear a fuego fuerte", tiempoEstimadoMinutos = 8, receta = receta2))

        recetaRepository.save(receta2)

        println("Recetas cargadas en Postgres")
    }
}