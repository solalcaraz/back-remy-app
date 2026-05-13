package linguini.company.backremyapp.dto

data class RecetaBusquedaRequest(
    val ingredientes: List<String>,
    val tiempoMaximo: Int? = null,
    val puedeComprar: Boolean = false,
)

data class RecetaBusquedaResponse(
    val recetas: List<BusquedaRecetaDTO>,
    val totalResultados: Int,
)

data class BusquedaRecetaDTO(
    val id: Long?,
    val nombre: String,
    val descripcion: String,
    val tiempoEnMinutos: Int,
    val dificultad: String,
    /*val tipoDieta: String,*/
    val img: String,
    val cantidadIngredientes: Int,
    val porcentajeMatch: Int,
    val ingredientesFaltantes: List<String>,
    val tags: Set<String>
)