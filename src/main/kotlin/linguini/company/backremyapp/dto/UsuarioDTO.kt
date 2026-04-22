package linguini.company.backremyapp.dto

import linguini.company.backremyapp.domain.Ingrediente
import java.util.UUID

data class UsuarioCompletoDTO(
    val id: UUID? = null,
    val nombre: String,
    val email: String,
    val foto: String?,
    val tipoDieta: String,
    val objetivo: String,
    val nivelCocina: String,
    val perfilEconomico: String,
    val ingredientesComunes: Set<Ingrediente>,
    val ingredientesAEvitar: Set<Ingrediente>
)

data class UsuarioPatchRequest(
    val nombre: String,
    val foto: String?,
    val tipoDieta: String,
    val objetivo: String,
    val nivelCocina: String,
    val perfilEconomico: String,
    val ingredientesComunes: Set<String>?,
    val ingredientesAEvitar: Set<String>?
)