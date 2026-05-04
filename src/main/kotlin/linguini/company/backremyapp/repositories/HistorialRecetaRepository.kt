package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.HistorialReceta
import linguini.company.backremyapp.domain.Receta
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import java.util.UUID

interface HistorialRecetaRepository : JpaRepository<HistorialReceta, Long> {

    @Query(
        """
        select h.receta
        from HistorialReceta h
        where h.usuario.id = :usuarioId
        order by h.fechaInicio desc
        """
    )
    fun findRecetasByUsuarioId(@Param("usuarioId") usuarioId: UUID): List<Receta>
}
