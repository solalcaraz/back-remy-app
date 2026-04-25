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
    var tiempoEnMinutos: Int,

    @Column(nullable = false)
    var porciones: Int,

    @Enumerated(EnumType.STRING)
    var dificultad: Dificultad,

    @OneToMany(mappedBy = "receta", cascade = [CascadeType.ALL], orphanRemoval = true)
    var ingredientes: MutableSet<RecetaIngrediente> = mutableSetOf(),

    @OneToMany(mappedBy = "receta", cascade = [CascadeType.ALL], orphanRemoval = true)
    @OrderBy("orden ASC")
    var pasos: MutableList<Paso> = mutableListOf(),

    @ElementCollection
    var tags: MutableSet<String> = mutableSetOf()
) {
    fun agregarIngrediente(ingrediente: RecetaIngrediente) {
        ingredientes.add(ingrediente)
        ingrediente.receta = this
    }
}

enum class Dificultad {
    FACIL,
    MEDIO,
    DIFICIL
}