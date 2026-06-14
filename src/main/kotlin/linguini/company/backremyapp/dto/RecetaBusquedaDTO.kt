package linguini.company.backremyapp.dto

data class RecomendacionRequest(
    val ingredientesExtra: List<String> = emptyList(),
    val tiempoMaximo: Int? = null,
    val puedeComprar: Boolean = false,
    val limite: Int = 10
){
    init {
        require(limite in 1..50) {
            "El límite debe estar entre 1 y 50"
        }

        require(tiempoMaximo == null || tiempoMaximo >= 1) {
            "El tiempo máximo debe ser mayor a 0"
        }
    }
}

data class SugerenciaDiariaDTO(
    val receta: ResumenRecetaDTO,
    val motivosPositivos: List<String>
)

data class RecomendacionPaginadaDTO(
    val data: List<RecomendacionRecetaDTO>,
    val page: Int,
    val size: Int,
    val totalItems: Long,
    val totalPage: Int
)
