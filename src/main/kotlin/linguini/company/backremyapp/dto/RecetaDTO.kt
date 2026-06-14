package linguini.company.backremyapp.dto

data class IngredienteRecetaDTO(
    val id: Long?,
    val nombre: String,
    val cantidad: Double,
    val unidadMedida: String,
    val reemplazo: BusquedaIngredientesSimilaresDTO? = null
)

data class ResumenPasoDTO(
    val id: Long?,
    val orden: Int,
    val titulo: String,
    val descripcion: String,
    val tiempoEstimadoMinutos: Int
)

data class RecetaCompletaDTO(
    val id: Long?,
    val nombre: String,
    val tiempoEnMinutos: Int,
    val porciones: Int,
    val dificultad: String,
    val ingredientes: List<IngredienteRecetaDTO>,
    val pasos: List<ResumenPasoDTO>,
    val tags: Set<String>,
    val restriccionesAlimentarias: Set<String>,
    val imgUrl: String
)

data class ResumenRecetaDTO(
    val id: Long?,
    val nombre: String,
    val descripcion: String,
    val tiempoEnMinutos: Int,
    val tags: Set<String>,
    val imgUrl: String,
    val favorito: Boolean,
)

data class RecomendacionRecetaDTO(
    val receta: ResumenRecetaDTO,
    val puntaje: Int,
    val costoAproximado: Double,
    val motivosPositivos: List<String>,
    val motivosNegativos: List<String>,
    val ingredientesCoincidentes: Set<String>,
    val ingredientesFaltantes: Set<String>
)
