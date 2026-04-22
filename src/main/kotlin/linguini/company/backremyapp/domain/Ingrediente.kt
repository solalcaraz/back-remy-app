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
)
    /* El slug sería una versión normalizada del nombre para evitar duplicados semánticos,
    búsquedas, integración con IA, URL, pero todavía no lo necesitamos creo */
    /*@Column(nullable = false, unique = true, length = 120)
    var slug: String*/
