package linguini.company.backremyapp.domain

import jakarta.persistence.*

@Entity
@Table(name = "pasos")
class Paso(
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    var orden: Int,
    var titulo: String,
    var descripcion: String,
    var detalle: String? = null,
    var tiempoEstimadoMinutos: Int,
    var tip: String? = null,
    var imagenUrl: String? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receta_id")
    var receta: Receta? = null
)