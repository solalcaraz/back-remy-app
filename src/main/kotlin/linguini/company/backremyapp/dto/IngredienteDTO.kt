package linguini.company.backremyapp.dto

data class IngredienteSimilarDTO(
    val id: Long?,
    val nombre: String,
    val categoria: String,
    val restricciones: Set<String>,
    val score: Double
)

data class BusquedaIngredientesSimilaresDTO(
    val nombreBuscado: String,
    val encontrado: Boolean,
    val coincidencias: List<String> = emptyList(),
    val resultados: List<IngredienteSimilarDTO> = emptyList()
)

data class SugerirReemplazoIngredienteRequest(
    val nombreIngrediente: String,
    val restriccionesUsuario: Set<String> = emptySet(),
    val ingredientesReceta: Set<String> = emptySet(),
    val limite: Int = 3
)
