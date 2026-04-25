package linguini.company.backremyapp.dto

import java.util.UUID

data class IngredienteRecetaDTO(
    val nombre: String,
    val cantidad: Double,
    val unidadMedida: String
)

data class ResumenPasoDTO(
    val orden: Int,
    val titulo: String,
    val descripcion: String,
    val tiempoEstimadoMinutos: Int
)

data class RecetaCompletaDTO(
    val id: UUID?,
    val nombre: String,
    val tiempoEnMinutos: Int,
    val porciones: Int,
    val dificultad: String,
    val ingredientes: List<IngredienteRecetaDTO>,
    val pasos: List<ResumenPasoDTO>,
    val tags: Set<String>,
    val tipoDieta: String
)