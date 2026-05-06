package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.RestriccionAlimentaria
import org.springframework.data.jpa.repository.JpaRepository

interface RestriccionAlimentariaRepository : JpaRepository<RestriccionAlimentaria, Long> {
    fun findByNombreIn(nombres: Collection<String>): List<RestriccionAlimentaria>
    fun findByNombre(nombre: String): RestriccionAlimentaria?
}
