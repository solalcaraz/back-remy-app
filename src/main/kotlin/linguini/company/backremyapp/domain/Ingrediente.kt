package linguini.company.backremyapp.domain
import jakarta.persistence.*

@Entity
@Table(name = "ingredientes")
class Ingrediente(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @Column(nullable = false, unique = true, length = 100)
    var nombre: String,

    @Column
    val unidadBase: UnidadMedida,

    @OneToOne(cascade = [CascadeType.ALL])
    var infoNutricional: InfoNutricional? = null
    // Para cuando hagamos la lógica de intercambio de ingredientes
    // var categoria: String?
)

enum class UnidadMedida(val label: String) {
    GRAMOS("gramos"),
    MILILITROS("militros"),
    UNIDAD("unidad"),
}
    /* El slug sería una versión normalizada del nombre para evitar duplicados semánticos,
    búsquedas, integración con IA, URL, pero todavía no lo necesitamos creo */
    /*@Column(nullable = false, unique = true, length = 120)
    var slug: String*/
