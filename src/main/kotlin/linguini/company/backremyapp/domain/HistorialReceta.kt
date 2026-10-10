package linguini.company.backremyapp.domain

import jakarta.persistence.*
import java.time.LocalDateTime

@Entity
@Table(
    name = "historial_recetas",
    uniqueConstraints = [
        UniqueConstraint(
            name = "historial_usuario_receta",
            columnNames = ["usuario_id", "receta_id"]
        )
    ]
)
// Una fila por usuario y receta: al volver a cocinarla se actualiza la fecha en lugar de duplicar la entrada.
class HistorialReceta(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    var usuario: Usuario,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receta_id", nullable = false)
    var receta: Receta,

    @Column(name = "fecha_inicio", nullable = false)
    var fechaInicio: LocalDateTime = LocalDateTime.now()
)
