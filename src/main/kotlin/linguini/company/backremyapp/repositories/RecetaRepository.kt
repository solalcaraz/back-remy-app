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

    //fun findAllByTiempoEnMinutosLessThan(minutos: Int): List<Receta>

    /*
     * Trae todas las recetas que contienen AL MENOS UNO de los ingredientes buscados,
     * con todos los datos necesarios para calcular el match en el servicio.
     *
     * El filtro de tipoDieta es opcional: si se pasa null, no filtra por dieta.
     * El filtro de tiempoMaximo también es opcional.
     *
     * Nota: el cálculo del porcentajeMatch y el ordenamiento se hacen en memoria
     * en RecetaService porque involucran lógica de negocio (ingredientes faltantes,
     * preferencias del usuario, etc.) que no corresponde a la query.
     */
    @EntityGraph(attributePaths = ["ingredientes", "ingredientes.ingrediente", "tags"])
    @Query("""
        SELECT DISTINCT r FROM Receta r
        JOIN r.ingredientes ri
        JOIN ri.ingrediente i
        WHERE LOWER(i.nombre) IN :nombresIngredientes
          AND (:tipoDieta IS NULL OR r.tipoDieta = :tipoDieta)
          AND (:tiempoMaximo IS NULL OR r.tiempoEnMinutos <= :tiempoMaximo)
    """)
    fun findByIngredientesAndFiltros(
        @Param("nombresIngredientes") nombresIngredientes: List<String>,
        @Param("tipoDieta") tipoDieta: TipoDieta?,
        @Param("tiempoMaximo") tiempoMaximo: Int?
    ): List<Receta>
}