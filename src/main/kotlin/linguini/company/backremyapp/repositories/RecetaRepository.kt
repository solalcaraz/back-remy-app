package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Receta
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import java.util.Optional

interface RecetaRepository : JpaRepository<Receta, Long> {
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "ingredientes.ingrediente.restriccionesAlimentarias", "pasos", "tags"])
    fun findWithDetailsById(id: Long): Optional<Receta>

    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "ingredientes.ingrediente.restriccionesAlimentarias", "pasos", "tags"])
    fun findAllWithDetailsBy(): List<Receta>

    fun findByNombre(nombre: String): Receta?

//fun findAllByTiempoEnMinutosLessThan(minutos: Int): List<Receta>
}
