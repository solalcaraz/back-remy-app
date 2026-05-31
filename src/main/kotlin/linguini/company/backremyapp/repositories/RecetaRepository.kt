package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Receta
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import java.util.Optional

interface RecetaRepository : JpaRepository<Receta, Long> {
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "ingredientes.ingrediente.restriccionesAlimentarias", "pasos", "tags"])
    fun findWithDetailsById(id: Long): Optional<Receta>

    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "ingredientes.ingrediente.restriccionesAlimentarias", "pasos", "tags"])
    fun findAllWithDetailsBy(): List<Receta>

    @Query("""
        SELECT r.id
        FROM Receta r
        LEFT JOIN r.ingredientesCore ricOrden
        LEFT JOIN ricOrden.ingrediente icOrden
        LEFT JOIN r.ingredientesReemplazables rirOrden
        LEFT JOIN rirOrden.ingrediente irOrden
        WHERE (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
          AND NOT EXISTS (
              SELECT ric FROM Receta rCoreEvitar
              JOIN rCoreEvitar.ingredientesCore ric
              WHERE rCoreEvitar = r
              AND ric.ingrediente.id IN :ingredientesAEvitarIds
          )
          AND NOT EXISTS (
              SELECT rir FROM Receta rReemplazableEvitar
              JOIN rReemplazableEvitar.ingredientesReemplazables rir
              WHERE rReemplazableEvitar = r
              AND rir.ingrediente.id IN :ingredientesAEvitarIds
          )
          AND NOT EXISTS (
              SELECT rio FROM Receta rOpcionalEvitar
              JOIN rOpcionalEvitar.ingredientesOpcionales rio
              WHERE rOpcionalEvitar = r
              AND rio.ingrediente.id IN :ingredientesAEvitarIds
          )
          AND (
              :restriccionesIds IS NULL OR NOT EXISTS (
                  SELECT ric2 FROM Receta rCoreRestriccion
                  JOIN rCoreRestriccion.ingredientesCore ric2
                  WHERE rCoreRestriccion = r
                  AND NOT EXISTS (
                      SELECT ra FROM ric2.ingrediente.restriccionesAlimentarias ra
                      WHERE ra.id IN :restriccionesIds
                  )
              )
          )
          AND (
              :restriccionesIds IS NULL OR NOT EXISTS (
                  SELECT rir2 FROM Receta rReemplazableRestriccion
                  JOIN rReemplazableRestriccion.ingredientesReemplazables rir2
                  WHERE rReemplazableRestriccion = r
                  AND NOT EXISTS (
                      SELECT ra FROM rir2.ingrediente.restriccionesAlimentarias ra
                      WHERE ra.id IN :restriccionesIds
                  )
              )
          )
          AND (
              :restriccionesIds IS NULL OR NOT EXISTS (
                  SELECT rio2 FROM Receta rOpcionalRestriccion
                  JOIN rOpcionalRestriccion.ingredientesOpcionales rio2
                  WHERE rOpcionalRestriccion = r
                  AND NOT EXISTS (
                      SELECT ra FROM rio2.ingrediente.restriccionesAlimentarias ra
                      WHERE ra.id IN :restriccionesIds
                  )
              )
          )
        GROUP BY r.id, r.tiempoEnMinutos
        ORDER BY
            COUNT(DISTINCT CASE WHEN icOrden.id IN :ingredientesComunesIds THEN icOrden.id ELSE NULL END) +
            COUNT(DISTINCT CASE WHEN irOrden.id IN :ingredientesComunesIds THEN irOrden.id ELSE NULL END) DESC,
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
              SELECT ric FROM Receta rCore
              JOIN rCore.ingredientesCore ric
              WHERE rCore = r
              AND LOWER(ric.ingrediente.nombre) NOT IN :disponibles
          )
          AND (
              SELECT COUNT(rir) FROM Receta rReemplazable
              JOIN rReemplazable.ingredientesReemplazables rir
              WHERE rReemplazable = r
              AND LOWER(rir.ingrediente.nombre) NOT IN :disponibles
          ) <= 2
          AND (
              r.ingredientesCore IS NOT EMPTY
              OR r.ingredientesReemplazables IS NOT EMPTY
              OR r.ingredientesOpcionales IS NOT EMPTY
          )
          AND NOT EXISTS (
              SELECT ric2 FROM Receta rCoreEvitar
              JOIN rCoreEvitar.ingredientesCore ric2
              WHERE rCoreEvitar = r
              AND LOWER(ric2.ingrediente.nombre) IN :aEvitar
          )
          AND NOT EXISTS (
              SELECT rir2 FROM Receta rReemplazableEvitar
              JOIN rReemplazableEvitar.ingredientesReemplazables rir2
              WHERE rReemplazableEvitar = r
              AND LOWER(rir2.ingrediente.nombre) IN :aEvitar
          )
          AND NOT EXISTS (
              SELECT rio2 FROM Receta rOpcionalEvitar
              JOIN rOpcionalEvitar.ingredientesOpcionales rio2
              WHERE rOpcionalEvitar = r
              AND LOWER(rio2.ingrediente.nombre) IN :aEvitar
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT ric3 FROM Receta rCoreRestriccion
                JOIN rCoreRestriccion.ingredientesCore ric3
                WHERE rCoreRestriccion = r
                AND NOT EXISTS (
                    SELECT ra FROM ric3.ingrediente.restriccionesAlimentarias ra
                    WHERE ra.id IN :restriccionesIds
                )
            )
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT rir3 FROM Receta rReemplazableRestriccion
                JOIN rReemplazableRestriccion.ingredientesReemplazables rir3
                WHERE rReemplazableRestriccion = r
                AND NOT EXISTS (
                    SELECT ra FROM rir3.ingrediente.restriccionesAlimentarias ra
                    WHERE ra.id IN :restriccionesIds
                )
            )
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT rio3 FROM Receta rOpcionalRestriccion
                JOIN rOpcionalRestriccion.ingredientesOpcionales rio3
                WHERE rOpcionalRestriccion = r
                AND NOT EXISTS (
                    SELECT ra FROM rio3.ingrediente.restriccionesAlimentarias ra
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
          AND (
              EXISTS (
                  SELECT ric FROM Receta rCore
                  JOIN rCore.ingredientesCore ric
                  WHERE rCore = r
                  AND LOWER(ric.ingrediente.nombre) IN :disponibles
              )
              OR EXISTS (
                  SELECT rir FROM Receta rReemplazable
                  JOIN rReemplazable.ingredientesReemplazables rir
                  WHERE rReemplazable = r
                  AND LOWER(rir.ingrediente.nombre) IN :disponibles
              )
              OR EXISTS (
                  SELECT rio FROM Receta rOpcional
                  JOIN rOpcional.ingredientesOpcionales rio
                  WHERE rOpcional = r
                  AND LOWER(rio.ingrediente.nombre) IN :disponibles
              )
          )
          AND NOT EXISTS (
              SELECT ric2 FROM Receta rCoreEvitar
              JOIN rCoreEvitar.ingredientesCore ric2
              WHERE rCoreEvitar = r
              AND LOWER(ric2.ingrediente.nombre) IN :aEvitar
          )
          AND NOT EXISTS (
              SELECT rir2 FROM Receta rReemplazableEvitar
              JOIN rReemplazableEvitar.ingredientesReemplazables rir2
              WHERE rReemplazableEvitar = r
              AND LOWER(rir2.ingrediente.nombre) IN :aEvitar
          )
          AND NOT EXISTS (
              SELECT rio2 FROM Receta rOpcionalEvitar
              JOIN rOpcionalEvitar.ingredientesOpcionales rio2
              WHERE rOpcionalEvitar = r
              AND LOWER(rio2.ingrediente.nombre) IN :aEvitar
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT ric3 FROM Receta rCoreRestriccion
                JOIN rCoreRestriccion.ingredientesCore ric3
                WHERE rCoreRestriccion = r
                AND NOT EXISTS (
                    SELECT ra FROM ric3.ingrediente.restriccionesAlimentarias ra
                    WHERE ra.id IN :restriccionesIds
                )
            )
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT rir3 FROM Receta rReemplazableRestriccion
                JOIN rReemplazableRestriccion.ingredientesReemplazables rir3
                WHERE rReemplazableRestriccion = r
                AND NOT EXISTS (
                    SELECT ra FROM rir3.ingrediente.restriccionesAlimentarias ra
                    WHERE ra.id IN :restriccionesIds
                )
            )
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT rio3 FROM Receta rOpcionalRestriccion
                JOIN rOpcionalRestriccion.ingredientesOpcionales rio3
                WHERE rOpcionalRestriccion = r
                AND NOT EXISTS (
                    SELECT ra FROM rio3.ingrediente.restriccionesAlimentarias ra
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
