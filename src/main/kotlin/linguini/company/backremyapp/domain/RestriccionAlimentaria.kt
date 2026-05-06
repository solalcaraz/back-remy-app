package linguini.company.backremyapp.domain

import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table

@Entity
@Table(name = "restricciones_alimentarias")
class RestriccionAlimentaria(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @Column(nullable = false, unique = true, length = 100)
    var nombre: String
) {
    /* No se que es esto, codex sabe cosas que yo no, lo vemos */
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is RestriccionAlimentaria) return false

        return id != null && id == other.id
    }

    override fun hashCode(): Int = id?.hashCode() ?: 0
}
