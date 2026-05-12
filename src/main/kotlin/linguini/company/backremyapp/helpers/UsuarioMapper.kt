package linguini.company.backremyapp.helpers

import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.UsuarioCompletoDTO
import linguini.company.backremyapp.dto.UsuarioPatchRequest
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service

interface UsuarioAdapter {
    fun fromDTO(usuarioPatch: UsuarioPatchRequest, usuario: Usuario)
    fun toFullDTO(usuario: Usuario): UsuarioCompletoDTO
}

@Service
class UsuarioMapper(
    @Value("\${app.base-url}")
    private val baseUrl: String
): UsuarioAdapter {
    override fun toFullDTO(usuario: Usuario): UsuarioCompletoDTO {
        return UsuarioCompletoDTO(
            id = usuario.id,
            nombre = usuario.nombre,
            email = usuario.email,
            foto = buildFotoUrl(usuario.fotoUrl),
            restriccionesAlimentarias = usuario.restriccionesAlimentarias.map { it.nombre }.toSet(),
            objetivo = usuario.objetivo.label,
            nivelCocina = usuario.nivelCocina.label,
            perfilEconomico = usuario.perfilEconomico.label,
            ingredientesComunes = usuario.ingredientesComunes().map { it.nombre }.toSet(),
            ingredientesAEvitar = usuario.ingredientesAEvitar().map { it.nombre }.toSet(),
        )
    }

    private fun buildFotoUrl(fotoUrl: String?): String? {
        if (fotoUrl == null) return null

        return if (fotoUrl.startsWith("http")) {
            fotoUrl
        } else {
            "$baseUrl$fotoUrl"
        }
    }

    override fun fromDTO(usuarioPatch: UsuarioPatchRequest, usuario: Usuario) {
        usuario.nombre = usuarioPatch.nombre
        usuario.fotoUrl = usuarioPatch.foto
        usuario.cambiarObjetivo(usuarioPatch.objetivo)
        usuario.cambiarNivelCocina(usuarioPatch.nivelCocina)
        usuario.cambiarPerfilEconomico(usuarioPatch.perfilEconomico)
    }
}
