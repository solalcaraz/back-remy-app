package linguini.company.backremyapp.domain

import jakarta.persistence.*
import java.time.LocalDateTime

@Entity
@Table(
    name = "favoritos_recetas",
    uniqueConstraints = [
        UniqueConstraint(
            name = "favorito_usuario_receta",
            columnNames = ["usuario_id", "receta_id"]
        )
    ]
)
class FavoritoReceta(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    var usuario: Usuario,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receta_id", nullable = false)
    var receta: Receta,

    @Column(name = "fecha_agregado", nullable = false)
    var fechaAgregado: LocalDateTime = LocalDateTime.now()
)
