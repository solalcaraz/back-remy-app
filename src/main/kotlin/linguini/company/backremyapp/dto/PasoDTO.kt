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
    /* NOTA: el front mock tiene 'tags' por paso, pero en el dominio
       los tags pertenecen a Receta, no a Paso.
       Opciones: 1) agregar tags a la entidad Paso, 2) eliminarlos del front.
       Por ahora se omiten aquí para no romper el dominio. */
)