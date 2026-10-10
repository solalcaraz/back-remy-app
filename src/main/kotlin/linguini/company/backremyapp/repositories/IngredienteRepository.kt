package linguini.company.backremyapp.repositories
import linguini.company.backremyapp.domain.Ingrediente
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.EntityGraph
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param

interface IngredienteRepository : JpaRepository<Ingrediente, Long> {
    fun findByNombreIn(nombres: Collection<String>): List<Ingrediente>
    fun findByNombre(nombre: String): Ingrediente?

    @Query("SELECT i FROM Ingrediente i WHERE LOWER(i.nombre) IN :nombres")
    fun findByNombreNormalizadoIn(@Param("nombres") nombres: Collection<String>): List<Ingrediente>

    @EntityGraph(attributePaths = ["restriccionesAlimentarias"])
    @Query("SELECT i FROM Ingrediente i WHERE LOWER(i.nombre) = LOWER(:nombre)")
    fun findByNombreIgnoreCaseWithRestricciones(@Param("nombre") nombre: String): Ingrediente?

    @Query("SELECT DISTINCT i FROM Ingrediente i LEFT JOIN FETCH i.restriccionesAlimentarias WHERE i.id IN :ids")
    fun findAllWithRestriccionesByIdIn(@Param("ids") ids: Collection<Long>): List<Ingrediente>

    @Query("SELECT i.nombre FROM Ingrediente i WHERE LOWER(i.nombre) LIKE LOWER(CONCAT(:query, '%')) ORDER BY i.nombre ASC")
    fun buscarNombres(@Param("query") query: String, pageable: Pageable): List<String>

    @Query("SELECT i.nombre FROM Ingrediente i WHERE LOWER(i.nombre) LIKE LOWER(CONCAT('%', :query, '%')) ORDER BY i.nombre ASC")
    fun buscarNombresQueContienen(@Param("query") query: String, pageable: Pageable): List<String>

    @Query(
        value = """
            SELECT i.id AS id, CAST(1 - (i.embedding <=> base.embedding) AS DOUBLE PRECISION) AS score
            FROM ingredientes i
            JOIN ingredientes base ON LOWER(base.nombre) = LOWER(:nombre)
            WHERE i.id <> base.id
              AND i.embedding IS NOT NULL
              AND base.embedding IS NOT NULL
            ORDER BY i.embedding <=> base.embedding ASC
        """,
        nativeQuery = true
    )
    fun buscarIdsSimilaresPorEmbedding(
        @Param("nombre") nombre: String,
        pageable: Pageable
    ): List<IngredienteSimilarProjection>
}

interface IngredienteSimilarProjection {
    val id: Long
    val score: Double
}
