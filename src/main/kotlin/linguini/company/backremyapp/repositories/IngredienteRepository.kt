package linguini.company.backremyapp.repositories
import linguini.company.backremyapp.domain.Ingrediente
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

/* @Component */
interface IngredienteRepository : JpaRepository<Ingrediente, Long> {
    fun findByNombreIn(nombres: Collection<String>): List<Ingrediente>
    fun findByNombre(nombre: String): Ingrediente?

    @Query("SELECT i.nombre FROM Ingrediente i WHERE LOWER(i.nombre) LIKE LOWER(CONCAT(:query, '%')) ORDER BY i.nombre ASC")
    fun buscarNombres(@Param("query") query: String, pageable: Pageable): List<String>
}