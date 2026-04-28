package linguini.company.backremyapp.domain

import jakarta.persistence.*

@Entity
@Table(name = "receta_ingredientes")
class RecetaIngrediente(
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receta_id")
    var receta: Receta? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ingrediente_id")
    var ingrediente: Ingrediente,

    var cantidad: Double,

    var unidadMedida: String
)