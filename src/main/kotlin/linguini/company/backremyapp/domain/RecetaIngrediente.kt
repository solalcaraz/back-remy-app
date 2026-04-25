package linguini.company.backremyapp.domain

import jakarta.persistence.*
import java.util.UUID

@Entity
@Table(name = "receta_ingredientes")
class RecetaIngrediente(
    @Id @GeneratedValue(strategy = GenerationType.UUID)
    var id: UUID? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receta_id")
    var receta: Receta? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ingrediente_id")
    var ingrediente: Ingrediente,

    var cantidad: Double,

    var unidadMedida: String
)