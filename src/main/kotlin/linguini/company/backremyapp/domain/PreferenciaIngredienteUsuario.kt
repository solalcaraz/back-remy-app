package linguini.company.backremyapp.domain
import jakarta.persistence.*

@Entity
@Table(
    name = "preferencias_ingredientes_usuario",
    uniqueConstraints = [
        UniqueConstraint(columnNames = ["usuario_id", "ingrediente_id"])
    ]
)
class PreferenciaIngredienteUsuario(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "usuario_id", nullable = false)
    var usuario: Usuario,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ingrediente_id", nullable = false)
    var ingrediente: Ingrediente,

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_preferencia", nullable = false)
    var tipo: TipoPreferenciaIngrediente
)

enum class TipoPreferenciaIngrediente {
    COMUN,
    EVITAR
}