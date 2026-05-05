package linguini.company.backremyapp.domain

import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.FetchType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne
import java.math.BigDecimal
import java.time.LocalDate

class PrecioIngrediente(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ingrediente_id", nullable = false)
    val ingrediente: Ingrediente,

    @Column
    val precio: BigDecimal,

    @Column
    val cantidadReferencia: BigDecimal,

    @Column
    val unidadReferencia: UnidadMedida,

    @Column
    val fechaActualizacion: LocalDate? = LocalDate.now()
)