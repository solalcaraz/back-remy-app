package linguini.company.backremyapp.domain

import jakarta.persistence.Column
import jakarta.persistence.Embedded
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.FetchType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.JoinColumn
import jakarta.persistence.JoinTable
import jakarta.persistence.ManyToMany
import jakarta.persistence.Table

@Entity
@Table(name = "ingredientes")
class Ingrediente(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @Column(nullable = false, unique = true, length = 100)
    var nombre: String,

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    val unidadBase: UnidadMedida,

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "ingredientes_restricciones_alimentarias",
        joinColumns = [JoinColumn(name = "ingrediente_id")],
        inverseJoinColumns = [JoinColumn(name = "restriccion_alimentaria_id")]
    )
    var restriccionesAlimentarias: MutableSet<RestriccionAlimentaria> = mutableSetOf(),

    @Embedded
    var infoNutricional: InfoNutricional? = null
) {
    fun cumpleRestriccion(restriccion: RestriccionAlimentaria): Boolean {
        return restriccionesAlimentarias.any { it.id == restriccion.id }
    }
}

enum class UnidadMedida(val label: String) {
    GRAMOS("gramos"),
    MILILITROS("militros"),
    UNIDAD("unidad"),
}
