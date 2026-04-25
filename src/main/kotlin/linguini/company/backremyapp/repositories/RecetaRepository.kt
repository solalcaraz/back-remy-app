package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Receta
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import java.util.Optional
import java.util.UUID

interface RecetaRepository : JpaRepository<Receta, UUID> {
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "pasos"])
    fun findWithDetailsById(id: UUID): Optional<Receta>

    //fun findAllByTiempoEnMinutosLessThan(minutos: Int): List<Receta>
}