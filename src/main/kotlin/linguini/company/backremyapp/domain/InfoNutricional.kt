package linguini.company.backremyapp.domain

import jakarta.persistence.*

@Entity
class InfoNutricional(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    var calorias: Double,
    var proteinas: Double,
    var carbohidratos: Double,
    var grasas: Double,
    var fibra: Double? = null,

    var cantidadReferencia: Double = 100.0,

    @Enumerated(EnumType.STRING)
    var unidadReferencia: UnidadMedida = UnidadMedida.GRAMOS
)