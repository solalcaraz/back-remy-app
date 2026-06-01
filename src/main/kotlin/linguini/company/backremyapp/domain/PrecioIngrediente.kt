package linguini.company.backremyapp.domain

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.FetchType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne
import jakarta.persistence.Table
import java.math.BigDecimal
import java.time.LocalDate

@Entity
@Table(name = "precios_ingredientes")
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

    @Enumerated(EnumType.STRING)
    @Column
    val unidadReferencia: UnidadMedida,

    @Column
    val fechaActualizacion: LocalDate? = LocalDate.now(),

    @Column
    val producto_referencia: String,

    @Column
    val origen_referencia: String
)
