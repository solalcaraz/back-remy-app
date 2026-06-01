package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.FotoPatchResponse
import linguini.company.backremyapp.dto.UsuarioPatchRequest
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.helpers.UsuarioMapper
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.RestriccionAlimentariaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.multipart.MultipartFile
import java.util.UUID

@Service
class UsuarioService(
    private val usuarioRepository: UsuarioRepository,
    private val usuarioMapper: UsuarioMapper,
    private val fileStorageService: FileStorageService,
    private val ingredienteRepository: IngredienteRepository,
    private val restriccionAlimentariaRepository: RestriccionAlimentariaRepository,
    @Value("\${app.base-url}")
    private val baseUrl: String
) {
    fun getUsuarioById(id: UUID): Usuario {
        val usuario = usuarioRepository.findPerfilById(id).orElseThrow { NotFoundException("Usuario no encontrado") }

        return usuario
    }

    @Transactional
    fun updateUsuario(id: UUID, usuarioPatch: UsuarioPatchRequest) {
        val usuario = usuarioRepository.findPerfilById(id).orElseThrow { NotFoundException("Usuario no encontrado") }

        usuarioMapper.fromDTO(usuarioPatch, usuario)
        actualizarRestriccionesAlimentarias(usuarioPatch, usuario)
        actualizarPreferenciasIngredientes(usuarioPatch, usuario)

        usuarioRepository.save(usuario)
    }

    @Transactional
    fun updateFotoUsuario(id: UUID, foto: MultipartFile): FotoPatchResponse {
        val usuario = usuarioRepository.findById(id).orElseThrow { NotFoundException("Usuario no encontrado") }

        val fotoUrl = fileStorageService.guardarFotoUsuario(id, foto)

        usuario.fotoUrl = fotoUrl

        return FotoPatchResponse(
            foto = fotoUrl.let { "$baseUrl$it" }
        )
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
        val nombresIngredientesNormalizados = nombresIngredientes.map { it.lowercase() }

        if (nombresIngredientes.isEmpty()) {
            usuario.preferenciasIngredientes.clear()
            return
        }

        val ingredientes = ingredienteRepository.findByNombreNormalizadoIn(nombresIngredientesNormalizados)

        if (ingredientes.size != nombresIngredientes.size) {
            val encontrados = ingredientes.map { it.nombre.lowercase() }.toSet()
            val faltantes = nombresIngredientes.filterNot { it.lowercase() in encontrados }

            throw NotFoundException(
                "No se encontraron los siguientes ingredientes: ${faltantes.joinToString(", ")}"
            )
        }

        val ingredientesPorNombre = ingredientes.associateBy { it.nombre.lowercase() }

        val comunes = ingredientesComunesNombres.map { nombre ->
            ingredientesPorNombre[nombre.lowercase()]
                ?: throw NotFoundException("Ingrediente no encontrado: $nombre")
        }

        val evitar = ingredientesAEvitarNombres.map { nombre ->
            ingredientesPorNombre[nombre.lowercase()]
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

    private fun actualizarRestriccionesAlimentarias(
        usuarioPatch: UsuarioPatchRequest,
        usuario: Usuario
    ) {
        val nombresRestricciones = usuarioPatch.restriccionesAlimentarias
            ?.map { normalizarRestriccionAlimentaria(it) }
            ?.filter { it.isNotBlank() }
            ?.distinct()
            ?: emptyList()

        if (nombresRestricciones.isEmpty()) {
            usuario.cambiarRestriccionesAlimentarias(emptyList())
            return
        }

        val restricciones = restriccionAlimentariaRepository.findByNombreNormalizadoIn(nombresRestricciones)

        if (restricciones.size != nombresRestricciones.size) {
            val encontradas = restricciones.map { it.nombre }.toSet()
            val faltantes = nombresRestricciones.filterNot { it in encontradas }

            throw NotFoundException(
                "No se encontraron las siguientes restricciones alimentarias: ${faltantes.joinToString(", ")}"
            )
        }

        usuario.cambiarRestriccionesAlimentarias(restricciones)
    }

    private fun normalizarRestriccionAlimentaria(nombre: String): String {
        return when (nombre.trim().lowercase().replace(" ", "_")) {
            "vegetariano" -> "vegetariano"
            "vegano" -> "vegano"
            "sin_gluten" -> "sin_gluten"
            "sin_lactosa" -> "sin_lactosa"
            "bajo_sodio" -> "bajo_sodio"
            else -> nombre.trim().lowercase().replace(" ", "_")
        }
    }
}
