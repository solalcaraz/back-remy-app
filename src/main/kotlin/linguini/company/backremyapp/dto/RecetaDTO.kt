package linguini.company.backremyapp.dto

import linguini.company.backremyapp.domain.Paso
import linguini.company.backremyapp.domain.RecetaIngrediente
import java.util.UUID

data class RecetaCompletaDTO(
    val id: UUID? = null,
    val nombre: String,
    val tiempoEnMinutos: Int,
    val porciones: Int,
    val dificultad: String,
    val ingredientes: Set<RecetaIngrediente>,
    val pasos: Set<Paso>,
    val tags: Set<String>,
    val tipoDieta: String
)