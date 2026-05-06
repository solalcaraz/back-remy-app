package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.TipoDieta
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import java.util.Optional

interface RecetaRepository : JpaRepository<Receta, Long> {
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "pasos", "tags"])
    fun findWithDetailsById(id: Long): Optional<Receta>

    fun findByNombre(nombre: String): Receta?

    //fun findAllByTiempoEnMinutosLessThan(minutos: Int): List<Receta>

    /*
    puedeComprar = false, entonces solo recetas con TODOS los ingredientes disponibles tanto en despensa como en el input de la busqueda
     */
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "tags"])
    @Query("""
        SELECT DISTINCT r FROM Receta r
        JOIN r.ingredientes ri
        JOIN ri.ingrediente i
        WHERE LOWER(i.nombre) IN :disponibles
          AND (:tipoDieta IS NULL OR r.tipoDieta = :tipoDieta)
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
    """)
    fun findConTodosLosIngredientes(
        @Param("disponibles") disponibles: List<String>,
        @Param("tipoDieta") tipoDieta: TipoDieta?,
        @Param("tiempoMaximo") tiempoMaximo: Int?,
        @Param("aEvitar") aEvitar: List<String>
    ): List<Receta>

    /*
    puedeComprar = true entonces recetas que tengan al menos uno de los ingredinetes disponibles
    se excluyen solamente los ing a evitar
    */
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "tags"])
    @Query("""
        SELECT DISTINCT r FROM Receta r
        JOIN r.ingredientes ri
        JOIN ri.ingrediente i
        WHERE LOWER(i.nombre) IN :disponibles
          AND (:tipoDieta IS NULL OR r.tipoDieta = :tipoDieta)
          AND (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
          AND NOT EXISTS (
              SELECT ri2 FROM RecetaIngrediente ri2
              WHERE ri2.receta = r
              AND LOWER(ri2.ingrediente.nombre) IN :aEvitar
        )
    """)
    fun findConAlgunIngrediente(
        @Param("disponibles") disponibles: List<String>,
        @Param("tipoDieta") tipoDieta: TipoDieta?,
        @Param("tiempoMaximo") tiempoMaximo: Int?,
        @Param("aEvitar") aEvitar: List<String>
    ): List<Receta>
}