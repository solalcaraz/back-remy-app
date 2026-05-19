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
        LEFT JOIN r.ingredientes ri
        LEFT JOIN ri.ingrediente i
        WHERE (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
          AND NOT EXISTS (
              SELECT ri2 FROM RecetaIngrediente ri2
              WHERE ri2.receta = r
              AND ri2.ingrediente.id IN :ingredientesAEvitarIds
          )
          AND (
              :restriccionesIds IS NULL OR NOT EXISTS (
                  SELECT ri3 FROM RecetaIngrediente ri3
                  WHERE ri3.receta = r
                  AND NOT EXISTS (
                      SELECT ra FROM ri3.ingrediente.restriccionesAlimentarias ra
                      WHERE ra.id IN :restriccionesIds
                  )
              )
          )
        GROUP BY r.id, r.tiempoEnMinutos
        ORDER BY
            SUM(CASE WHEN i.id IN :ingredientesComunesIds THEN 1 ELSE 0 END) DESC,
            SUM(CASE WHEN i.id IN :ingredientesAEvitarIds THEN 1 ELSE 0 END) ASC,
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

    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "ingredientes.ingrediente.restriccionesAlimentarias", "pasos", "tags"])
    @Query("SELECT DISTINCT r FROM Receta r WHERE r.id IN :ids")
    fun findAllWithDetailsByIdIn(@Param("ids") ids: List<Long>): List<Receta>

    fun findByNombre(nombre: String): Receta?

    //fun findAllByTiempoEnMinutosLessThan(minutos: Int): List<Receta>

    /* busquedaActiva = true y puedeComprar = false,
    entonces solo recetas con TODOS los ingredientes disponibles tanto en despensa como en el input de la busqueda
    no contiene ing a evitar y cumple las restricciones del user
    y pageable para no traer recetas sin limite
     */
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "ingredientes.ingrediente.restriccionesAlimentarias", "pasos", "tags"])
    @Query("""
        SELECT DISTINCT r FROM Receta r
        JOIN r.ingredientes ri
        JOIN ri.ingrediente i
        WHERE LOWER(i.nombre) IN :disponibles
          AND (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
          AND NOT EXISTS (
              SELECT ri2 FROM RecetaIngrediente ri2
              WHERE ri2.receta = r
              AND LOWER(ri2.ingrediente.nombre) NOT IN :disponibles
          )
          AND NOT EXISTS (
              SELECT ri3 FROM RecetaIngrediente ri3
              WHERE ri3.receta = r
              AND LOWER(ri3.ingrediente.nombre) IN :aEvitar
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT ri4 FROM RecetaIngrediente ri4
                WHERE ri4.receta = r
                AND NOT EXISTS (
                    SELECT ri4 FROM ri4.ingrediente.restriccionesAlimentarias ra
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
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "ingredientes.ingrediente.restriccionesAlimentarias", "pasos", "tags"])
    @Query("""
        SELECT DISTINCT r FROM Receta r
        JOIN r.ingredientes ri
        JOIN ri.ingrediente i
        WHERE LOWER(i.nombre) IN :disponibles
          AND (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
          AND NOT EXISTS (
              SELECT ri2 FROM RecetaIngrediente ri2
              WHERE ri2.receta = r
              AND LOWER(ri2.ingrediente.nombre) IN :aEvitar
          )
          AND (
            :restriccionesIds IS NULL OR NOT EXISTS (
                SELECT ri3 FROM RecetaIngrediente ri3
                WHERE ri3.receta = r
                AND NOT EXISTS (
                    SELECT ra FROM ri3.ingrediente.restriccionesAlimentarias ra
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
