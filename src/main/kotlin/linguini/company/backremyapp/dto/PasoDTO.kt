package linguini.company.backremyapp.dto

data class PasoCompletoDTO(
    val id: Long?,
    val orden: Int,
    val titulo: String,
    val descripcion: String,
    val detalle: String?,
    val tiempoEstimadoMinutos: Int,
    val tip: String?,
    val imagenUrl: String?
)