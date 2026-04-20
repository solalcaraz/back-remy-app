package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.UsuarioPatchRequest
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.helpers.UsuarioMapper
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.util.UUID

@Service
class UsuarioService(
    private val usuarioRepository: UsuarioRepository,
    private val usuarioMapper: UsuarioMapper,
    private val ingredienteRepository: IngredienteRepository
) {
    fun getUsuarioById(id: UUID): Usuario {
        val usuario = usuarioRepository.findPerfilById(id).orElseThrow { NotFoundException("Usuario no encontrado") }

        return usuario
    }

    @Transactional
    fun updateUsuario(id: UUID, usuarioPatch: UsuarioPatchRequest) {
        val usuario = usuarioRepository.findPerfilById(id).orElseThrow { NotFoundException("Usuario no encontrado") }

        usuarioMapper.fromDTO(usuarioPatch, usuario)
        actualizarPreferenciasIngredientes(usuarioPatch, usuario)

        usuarioRepository.save(usuario)
    }

    private fun actualizarPreferenciasIngredientes(
        usuarioPatch: UsuarioPatchRequest,
        usuario: Usuario
    ) {
        val ingredientesComunesNombres = usuarioPatch.ingredientesComunes
            ?.map { it.trim() }
            ?.filter { it.isNotBlank() }
            ?.distinct()
            ?: emptyList()

        val ingredientesAEvitarNombres = usuarioPatch.ingredientesAEvitar
            ?.map { it.trim() }
            ?.filter { it.isNotBlank() }
            ?.distinct()
            ?: emptyList()

        val nombresIngredientes = (ingredientesComunesNombres + ingredientesAEvitarNombres).distinct()

        if (nombresIngredientes.isEmpty()) {
            usuario.preferenciasIngredientes.clear()
            return
        }

        val ingredientes = ingredienteRepository.findByNombreIn(nombresIngredientes)

        if (ingredientes.size != nombresIngredientes.size) {
            val encontrados = ingredientes.map { it.nombre }.toSet()
            val faltantes = nombresIngredientes.filterNot { it in encontrados }

            throw NotFoundException(
                "No se encontraron los siguientes ingredientes: ${faltantes.joinToString(", ")}"
            )
        }

        val ingredientesPorNombre = ingredientes.associateBy { it.nombre }

        val comunes = ingredientesComunesNombres.map { nombre ->
            ingredientesPorNombre[nombre]
                ?: throw NotFoundException("Ingrediente no encontrado: $nombre")
        }

        val evitar = ingredientesAEvitarNombres.map { nombre ->
            ingredientesPorNombre[nombre]
                ?: throw NotFoundException("Ingrediente no encontrado: $nombre")
        }

        comunes.forEach { ingrediente ->
            usuario.agregarIngredienteComun(ingrediente)
        }

        evitar.forEach { ingrediente ->
            usuario.agregarIngredienteAEvitar(ingrediente)
        }

        val ingredientesFinalesIds = (comunes + evitar)
            .mapNotNull { it.id }
            .toSet()

        usuario.eliminarPreferenciasQueNoEstanEn(ingredientesFinalesIds)
    }
}