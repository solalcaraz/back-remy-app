package linguini.company.backremyapp.repositories
import linguini.company.backremyapp.domain.PreferenciaIngredienteUsuario
import org.springframework.data.jpa.repository.JpaRepository

/* @Component */
interface PreferenciaIngredienteUsuarioRepository : JpaRepository<PreferenciaIngredienteUsuario, Long> {

}