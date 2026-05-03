package linguini.company.backremyapp.dto

data class RecetaBusquedaRequest(
    val ingredientes: List<String>,
    val tiempoMaximo: Int? = null,        // null = sin límite
    val tipoDieta: String? = null,        // null = todas
    val puedeComprar: Boolean = false,    // si puede comprar ingredientes faltantes
    val usuarioId: String? = null         // para incluir preferencias del perfil
)

data class RecetaBusquedaResponse(
    val recetas: List<ResumenRecetaDTO>,
    val totalResultados: Int,
    val busquedaId: String
)

data class ResumenRecetaDTO(
    val id: Long?,
    val nombre: String,
    val descripcion: String,
    val tiempoEnMinutos: Int,
    val dificultad: String,
    val cantidadIngredientes: Int,
    val porcentajeMatch: Int,
    val ingredientesFaltantes: List<String>,
    val tags: Set<String>,
    val tipoDieta: String
)