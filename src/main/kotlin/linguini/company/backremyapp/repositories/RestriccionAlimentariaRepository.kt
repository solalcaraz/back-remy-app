package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.RestriccionAlimentaria
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface RestriccionAlimentariaRepository : JpaRepository<RestriccionAlimentaria, Long> {
    fun findByNombreIn(nombres: Collection<String>): List<RestriccionAlimentaria>
    fun findByNombre(nombre: String): RestriccionAlimentaria?

    @Query("SELECT r FROM RestriccionAlimentaria r WHERE LOWER(r.nombre) IN :nombres")
    fun findByNombreNormalizadoIn(@Param("nombres") nombres: Collection<String>): List<RestriccionAlimentaria>
}
