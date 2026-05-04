package linguini.company.backremyapp.repositories
import linguini.company.backremyapp.domain.Usuario
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import java.util.Optional
import java.util.UUID

/* @Component */
interface UsuarioRepository : JpaRepository<Usuario, UUID> {
    @EntityGraph(attributePaths = ["preferenciasIngredientes", "preferenciasIngredientes.ingrediente"])
    @Query("select u from Usuario u where u.id = :id")
    fun findPerfilById(@Param("id") id: UUID): Optional<Usuario>

    fun findByEmail(email: String): Usuario?

    @EntityGraph(attributePaths = ["favoritos", "favoritos.receta"])
    fun findWithFavoritosById(id: UUID): Optional<Usuario>

    @EntityGraph(attributePaths = ["historial", "historial.receta"])
    fun findWithHistorialById(id: UUID): Optional<Usuario>
}