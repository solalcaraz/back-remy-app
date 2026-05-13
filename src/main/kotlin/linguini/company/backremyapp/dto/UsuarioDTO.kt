package linguini.company.backremyapp.dto

import java.util.UUID

data class UsuarioCompletoDTO(
    val id: UUID? = null,
    val nombre: String,
    val email: String,
    val foto: String?,
    val restriccionesAlimentarias: Set<String>,
    val objetivo: String,
    val nivelCocina: String,
    val perfilEconomico: String,
    val ingredientesComunes: Set<String>,
    val ingredientesAEvitar: Set<String>
)

data class UsuarioPatchRequest(
    val nombre: String,
    val foto: String?,
    val restriccionesAlimentarias: Set<String>?,
    val objetivo: String,
    val nivelCocina: String,
    val perfilEconomico: String,
    val ingredientesComunes: Set<String>?,
    val ingredientesAEvitar: Set<String>?
)

data class FotoPatchResponse(
    val foto: String,
)
