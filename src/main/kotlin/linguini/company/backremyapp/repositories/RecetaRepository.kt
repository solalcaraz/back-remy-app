package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Receta
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import java.util.Optional

interface RecetaRepository : JpaRepository<Receta, Long> {
    @EntityGraph(attributePaths = [
        "ingredientes",
        "ingredientes.ingrediente",
        "ingredientes.ingrediente.restriccionesAlimentarias",
        "pasos",
        "tags"
    ])
    fun findWithDetailsById(id: Long): Optional<Receta>

    @EntityGraph(attributePaths = [
        "ingredientes",
        "ingredientes.ingrediente",
        "ingredientes.ingrediente.restriccionesAlimentarias",
        "pasos",
        "tags"
    ])
    fun findAllWithDetailsBy(): List<Receta>

    @Query("""
        SELECT r.id
        FROM Receta r
        LEFT JOIN r.ingredientes riOrden
        LEFT JOIN riOrden.ingrediente iOrden
        WHERE (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
          AND NOT EXISTS (
              SELECT riCoreDisponible FROM Receta rCoreDisponible
              JOIN rCoreDisponible.ingredientes riCoreDisponible
              WHERE rCoreDisponible = r
              AND riCoreDisponible.tipo = linguini.company.backremyapp.domain.TipoIngredienteReceta.CORE
              AND riCoreDisponible.ingrediente.id NOT IN :ingredientesComunesIds
          )
          AND (
              SELECT COUNT(riReemplazableDisponible) FROM Receta rReemplazableDisponible
              JOIN rReemplazableDisponible.ingredientes riReemplazableDisponible
              WHERE rReemplazableDisponible = r
              AND riReemplazableDisponible.tipo = linguini.company.backremyapp.domain.TipoIngredienteReceta.REEMPLAZABLE
              AND riReemplazableDisponible.ingrediente.id NOT IN :ingredientesComunesIds
          ) <= 5
          AND NOT EXISTS (
              SELECT riEvitar FROM Receta rEvitar
              JOIN rEvitar.ingredientes riEvitar
              WHERE rEvitar = r
              AND riEvitar.ingrediente.id IN :ingredientesAEvitarIds
          )
          AND (
              :restriccionesIds IS NULL OR NOT EXISTS (
                  SELECT riRestriccion FROM Receta rRestriccion
                  JOIN rRestriccion.ingredientes riRestriccion
                  WHERE rRestriccion = r
                  AND NOT EXISTS (
                      SELECT ra FROM riRestriccion.ingrediente.restriccionesAlimentarias ra
                      WHERE ra.id IN :restriccionesIds
                  )
              )
          )
        GROUP BY r.id, r.tiempoEnMinutos
        ORDER BY
            COUNT(DISTINCT CASE
                WHEN riOrden.tipo IN (
                    linguini.company.backremyapp.domain.TipoIngredienteReceta.CORE,
                    linguini.company.backremyapp.domain.TipoIngredienteReceta.REEMPLAZABLE
                )
                AND iOrden.id IN :ingredientesComunesIds THEN iOrden.id ELSE NULL
            END) DESC,
            r.tiempoEnMinutos ASC,
            r.id ASC
    """)
    fun findIdsCandidatasParaRecomendacion(
        @Param("ingredientesComunesIds") ingredientesComunesIds: List<Long>,
        @Param("ingredientesAEvitarIds") ingredientesAEvitarIds: List<Long>,
        @Param("restriccionesIds") restriccionesIds: List<Long>?,
        @Param("tiempoMaximo") tiempoMaximo: Int?,
        pageable: Pageable
    ): List<Long>

    @EntityGraph(attributePaths = [
        "ingredientes",
        "ingredientes.ingrediente",
        "ingredientes.ingrediente.restriccionesAlimentarias",
        "pasos",
        "tags"
    ])
    @Query("SELECT DISTINCT r FROM Receta r WHERE r.id IN :ids")
    fun findAllWithDetailsByIdIn(@Param("ids") ids: List<Long>): List<Receta>

    fun findByNombre(nombre: String): Receta?

    //fun findAllByTiempoEnMinutosLessThan(minutos: Int): List<Receta>

    /* busquedaActiva = true y puedeComprar = false,
    entonces solo recetas con TODOS los ingredientes disponibles tanto en despensa como en el input de la busqueda
    no contiene ing a evitar y cumple las restricciones del user
    y pageable para no traer recetas sin limite
     */
    @Query("""
        SELECT DISTINCT r FROM Receta r
        WHERE (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
          AND NOT EXISTS (
              SELECT riCore FROM Receta rCore
              JOIN rCore.ingredientes riCore
              WHERE rCore = r
              AND riCore.tipo = linguini.company.backremyapp.domain.TipoIngredienteReceta.CORE
              AND LOWER(riCore.ingrediente.nombre) NOT IN :disponibles
          )
          AND (
              SELECT COUNT(riReemplazable) FROM Receta rReemplazable
              JOIN rReemplazable.ingredientes riReemplazable
              WHERE rReemplazable = r
              AND riReemplazable.tipo = linguini.company.backremyapp.domain.TipoIngredienteReceta.REEMPLAZABLE
              AND LOWER(riReemplazable.ingrediente.nombre) NOT IN :disponibles
          ) <= 2
          AND r.ingredientes IS NOT EMPTY
          AND NOT EXISTS (
              SELECT riEvitar FROM Receta rEvitar
              JOIN rEvitar.ingredientes riEvitar
              WHERE rEvitar = r
              AND LOWER(riEvitar.ingrediente.nombre) IN :aEvitar
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT riRestriccion FROM Receta rRestriccion
                JOIN rRestriccion.ingredientes riRestriccion
                WHERE rRestriccion = r
                AND NOT EXISTS (
                    SELECT ra FROM riRestriccion.ingrediente.restriccionesAlimentarias ra
                    WHERE ra.id IN :restriccionesIds
                )
            )
          )
    """)
    fun findConTodosLosIngredientes(
        @Param("disponibles") disponibles: List<String>,
        @Param("tiempoMaximo") tiempoMaximo: Int?,
        @Param("aEvitar") aEvitar: List<String>,
        @Param("restriccionesIds") restriccionesIds: List<Long>?,
        pageable: Pageable
    ): List<Receta>

    /* busquedaActiva=true y puedeComprar = true
    entonces recetas que tengan al menos uno de los ingredinetes disponibles
    se excluyen solamente los ing a evitar y tambien cumple las restricciones alimentarias
    y pageable para no traer recetas sin limite
    */
    @Query("""
        SELECT DISTINCT r FROM Receta r
        WHERE (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
          AND EXISTS (
              SELECT riDisponible FROM Receta rDisponible
              JOIN rDisponible.ingredientes riDisponible
              WHERE rDisponible = r
              AND LOWER(riDisponible.ingrediente.nombre) IN :disponibles
          )
          AND NOT EXISTS (
              SELECT riEvitar FROM Receta rEvitar
              JOIN rEvitar.ingredientes riEvitar
              WHERE rEvitar = r
              AND LOWER(riEvitar.ingrediente.nombre) IN :aEvitar
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT riRestriccion FROM Receta rRestriccion
                JOIN rRestriccion.ingredientes riRestriccion
                WHERE rRestriccion = r
                AND NOT EXISTS (
                    SELECT ra FROM riRestriccion.ingrediente.restriccionesAlimentarias ra
                    WHERE ra.id IN :restriccionesIds
                )
            )
          )
    """)
    fun findConAlgunIngrediente(
        @Param("disponibles") disponibles: List<String>,
        @Param("tiempoMaximo") tiempoMaximo: Int?,
        @Param("aEvitar") aEvitar: List<String>,
        @Param("restriccionesIds") restriccionesIds: List<Long>?,
        pageable: Pageable
    ): List<Receta>
}
