package linguini.company.backremyapp.domain

import jakarta.persistence.Embeddable
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated

@Embeddable
class InfoNutricional(
    var calorias: Double,
    var proteinas: Double,
    var carbohidratos: Double,
    var grasas: Double,
    var fibra: Double? = null,

    var cantidadReferencia: Double = 100.0,

    @Enumerated(EnumType.STRING)
    var unidadReferencia: UnidadMedida = UnidadMedida.GRAMOS
)
