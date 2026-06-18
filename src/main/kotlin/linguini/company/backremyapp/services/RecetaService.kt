package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.FavoritoRecetaRepository
import linguini.company.backremyapp.repositories.HistorialRecetaRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.util.UUID

@Service
class RecetaService (
    private val recetaRepository: RecetaRepository,
    private val usuarioRepository: UsuarioRepository,
    private val historialRecetaRepository: HistorialRecetaRepository,
    private val favoritoRecetaRepository: FavoritoRecetaRepository
) {
    @Transactional(readOnly = true)
    fun getRecetaCompletaById(id: Long): Receta {
        val receta = recetaRepository.findWithDetailsById(id).orElseThrow { NotFoundException("Receta no encontrada") }

        return receta
    }

    @Transactional(readOnly = true)
    fun getPerfilUsuario(usuarioId: UUID): Usuario {
        return usuarioRepository.findPerfilById(usuarioId)
            .orElseThrow { NotFoundException("Usuario no encontrado") }
    }

    //fun findAllByRestriccionesAlimentariasAndDificultad(...)

    @Transactional(readOnly = true)
    fun getHistorial(usuarioId: UUID): List<Receta> {
        verificarUsuarioExiste(usuarioId)
        return historialRecetaRepository.findHistorialWithRecetaTagsByUsuarioId(usuarioId)
            .map { it.receta }
    }

    @Transactional
    fun comenzarReceta(usuarioId: UUID, recetaId: Long) {
        val usuario = buscarUsuarioConHistorial(usuarioId)
        val receta = recetaRepository.findWithDetailsById(recetaId)
            .orElseThrow { NotFoundException("Receta no encontrada") }

        usuario.comenzarReceta(receta)
        usuarioRepository.save(usuario)
    }

    @Transactional(readOnly = true)
    fun getFavoritos(usuarioId: UUID): List<Receta> {
        verificarUsuarioExiste(usuarioId)
        return favoritoRecetaRepository.findFavoritosWithRecetaTagsByUsuarioId(usuarioId)
            .map { it.receta }
    }

    @Transactional(readOnly = true)
    fun getFavoritosIds(usuarioId: UUID): Set<Long> {
        verificarUsuarioExiste(usuarioId)
        return favoritoRecetaRepository.findRecetaIdsByUsuarioId(usuarioId)
    }

    @Transactional
    fun agregarFavorito(usuarioId: UUID, recetaId: Long) {
        val usuario = buscarUsuarioConFavoritos(usuarioId)
        val receta = recetaRepository.findById(recetaId)
            .orElseThrow { NotFoundException("Receta no encontrada") }

        usuario.agregarFavorito(receta)
        usuarioRepository.save(usuario)
    }

    @Transactional
    fun eliminarFavorito(usuarioId: UUID, recetaId: Long) {
        val usuario = buscarUsuarioConFavoritos(usuarioId)
        val receta = recetaRepository.findById(recetaId)
            .orElseThrow { NotFoundException("Receta no encontrada") }

        usuario.eliminarFavorito(receta)
        usuarioRepository.save(usuario)
    }


    private fun verificarUsuarioExiste(usuarioId: UUID) {
        if (!usuarioRepository.existsById(usuarioId)) {
            throw NotFoundException("Usuario no encontrado")
        }
    }

    private fun buscarUsuarioConFavoritos(usuarioId: UUID): Usuario {
        return usuarioRepository.findWithFavoritosById(usuarioId)
            .orElseThrow { NotFoundException("Usuario no encontrado") }
    }

    private fun buscarUsuarioConHistorial(usuarioId: UUID): Usuario {
        return usuarioRepository.findWithHistorialById(usuarioId)
            .orElseThrow { NotFoundException("Usuario no encontrado") }
    }
}
