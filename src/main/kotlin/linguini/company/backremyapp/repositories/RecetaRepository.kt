package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Receta
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.repository.query.Param
import java.util.Optional
import java.util.UUID

interface RecetaRepository : JpaRepository<Receta, UUID> {
    @EntityGraph
    fun findRecetaById(@Param("id") id: UUID): Optional<Receta>
}