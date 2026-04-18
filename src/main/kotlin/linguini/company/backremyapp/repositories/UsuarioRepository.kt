package linguini.company.backremyapp.repositories
import linguini.company.backremyapp.domain.Usuario
import org.springframework.data.jpa.repository.JpaRepository
import java.util.UUID

/* @Component */
interface UsuarioRepository : JpaRepository<Usuario, UUID> {
    fun findByEmail(email: String): Usuario?
}