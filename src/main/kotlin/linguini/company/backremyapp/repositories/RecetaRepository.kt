package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Receta
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import java.util.Optional

interface RecetaRepository : JpaRepository<Receta, Long> {
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "pasos", "tags"])
    fun findWithDetailsById(id: Long): Optional<Receta>

    fun findByNombre(nombre: String): Receta?

//fun findAllByTiempoEnMinutosLessThan(minutos: Int): List<Receta>
}