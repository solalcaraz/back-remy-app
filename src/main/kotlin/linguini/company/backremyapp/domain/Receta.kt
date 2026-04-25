package linguini.company.backremyapp.domain

import jakarta.persistence.*
import java.util.UUID

@Entity
@Table(name = "recetas")
class Receta(
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    var id: UUID? = null,

    @Column(nullable = false, length = 100)
    var nombre: String,

    @Column(nullable = false)
    var tiempoEnMinutos: Int = 0,

    @Column(nullable = false)
    var porciones: Int = 0,
    // Pensar en grupo: lógica para que se calculen solas por el peso de la comida

    @Enumerated(EnumType.STRING)
    var dificultad: NivelCocina, // Declarado en Usuario
    // Pensar en grupo: lógica para que se determine solo por cantidad de pasos, rareza de ingredientes, tiempo de cocina

    @OneToMany(mappedBy = "receta", cascade = [CascadeType.ALL], orphanRemoval = true)
    var ingredientes: MutableSet<RecetaIngrediente> = mutableSetOf(),

    @OneToMany(mappedBy = "receta", cascade = [CascadeType.ALL], orphanRemoval = true)
    @OrderBy("orden ASC")
    var pasos: MutableList<Paso> = mutableListOf(),

    @ElementCollection
    var tags: MutableSet<String> = mutableSetOf(),

    @Enumerated(EnumType.STRING)
    var tipoDieta: TipoDieta // Declarado en Usuario
    // Pensar en grupo: lógica para que se determine solo por tipo de ingredientes
) {
    @PrePersist
    @PreUpdate
    fun sincronizarDatosAutomaticos() {
        this.tiempoEnMinutos = calcularTiempo()
        this.porciones = calcularPorciones()
        this.dificultad = calcularDificultad()
        //this.tipoDieta = determinarTipoDieta()
    }

    fun calcularTiempo() : Int = pasos.sumOf { it.tiempoEstimadoMinutos }

    fun calcularPorciones() : Int = 0
    // Pensar en grupo regla de negocio.
    // Si es por el peso de los ingredientes, tener en cuenta un margen de error; además solo contar sólidos

    fun calcularDificultad(): NivelCocina {
        // Pensar en grupo regla de negocio. Por ahora:
        val puntaje = (pasos.size * 2) + (ingredientes.size * 1.5) + (tiempoEnMinutos / 10)

        return when {
            puntaje < 15 -> NivelCocina.BASICO
            puntaje < 30 -> NivelCocina.INTERMEDIO
            else -> NivelCocina.AVANZADO
        }
    }

//    @PrePersist
//    @PreUpdate
//    fun determinarTipoDieta(): TipoDieta {
//        val ingredientesList = ingredientes.map { it.ingrediente }
//
        // Habría que agregar en Ingrediente la categoría y que lo determine en función de eso
//        return when {
//            ingredientesList.all { it.esVegano } -> TipoDieta.VEGANO
//            ingredientesList.all { it.esVegetariano } -> TipoDieta.VEGETARIANO
//            ingredientesList.all { it.esLibreGluten } -> TipoDieta.CELIACO
//            else -> TipoDieta.OMNIVORO
//        }
//    }
}