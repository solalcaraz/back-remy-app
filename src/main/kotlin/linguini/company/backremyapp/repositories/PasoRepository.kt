package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Paso
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface PasoRepository : JpaRepository<Paso, Long> {

    @Query("SELECT p FROM Paso p WHERE p.receta.id = :recetaId ORDER BY p.orden ASC")
    fun findByRecetaIdOrderByOrden(@Param("recetaId") recetaId: Long): List<Paso>
}