package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.FavoritoReceta
import linguini.company.backremyapp.domain.Receta
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import java.util.UUID

interface FavoritoRecetaRepository : JpaRepository<FavoritoReceta, Long> {

    @Query(
        """
        select f.receta
        from FavoritoReceta f
        where f.usuario.id = :usuarioId
        order by f.fechaAgregado desc
        """
    )
    fun findRecetasByUsuarioId(@Param("usuarioId") usuarioId: UUID): List<Receta>

    @Query(
        """
        select distinct f
        from FavoritoReceta f
        join fetch f.receta r
        left join fetch r.tags
        where f.usuario.id = :usuarioId
        order by f.fechaAgregado desc
        """
    )
    fun findFavoritosWithRecetaTagsByUsuarioId(@Param("usuarioId") usuarioId: UUID): List<FavoritoReceta>

    @Query(
        """
        select f.receta.id
        from FavoritoReceta f
        where f.usuario.id = :usuarioId
        """
    )
    fun findRecetaIdsByUsuarioId(@Param("usuarioId") usuarioId: UUID): Set<Long>
}
