package linguini.company.backremyapp.helpers

import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.UsuarioCompletoDTO
import linguini.company.backremyapp.dto.UsuarioPatchRequest
import org.springframework.stereotype.Service

interface UsuarioAdapter {
    fun fromDTO(usuarioPatch: UsuarioPatchRequest, usuario: Usuario)
    fun toFullDTO(usuario: Usuario): UsuarioCompletoDTO
}

@Service
class UsuarioMapper: UsuarioAdapter {
    override fun toFullDTO(usuario: Usuario): UsuarioCompletoDTO {
        return UsuarioCompletoDTO(
            id = usuario.id,
            nombre = usuario.nombre,
            email = usuario.email,
            foto = usuario.fotoUrl,
            tipoDieta = usuario.tipoDieta.label,
            objetivo = usuario.objetivo.label,
            nivelCocina = usuario.nivelCocina.label,
            perfilEconomico = usuario.perfilEconomico.label,
            ingredientesComunes = usuario.ingredientesComunes(),
            ingredientesAEvitar = usuario.ingredientesAEvitar(),
        )
    }

    override fun fromDTO(usuarioPatch: UsuarioPatchRequest, usuario: Usuario) {
        usuario.nombre = usuarioPatch.nombre
        usuario.fotoUrl = usuarioPatch.foto
        usuario.cambiarTipoDieta(usuarioPatch.tipoDieta)
        usuario.cambiarObjetivo(usuarioPatch.objetivo)
        usuario.cambiarNivelCocina(usuarioPatch.nivelCocina)
        usuario.cambiarPerfilEconomico(usuarioPatch.perfilEconomico)
    }
}