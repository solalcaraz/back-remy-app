package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.TipoDieta
import linguini.company.backremyapp.dto.RecetaBusquedaRequest
import linguini.company.backremyapp.dto.RecetaBusquedaResponse
import linguini.company.backremyapp.dto.ResumenRecetaDTO
import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.BusquedaRecetaDTO
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

    //fun findAllByRestriccionesAlimentariasAndDificultad(...)

    @Transactional(readOnly = true)
    fun buscarRecetas(req: RecetaBusquedaRequest): RecetaBusquedaResponse {
        val ingredientesBuscados = req.ingredientes.map { it.trim().lowercase() }

        val usuario = req.usuarioId
            ?.let { runCatching { UUID.fromString(it) }.getOrNull() }
            ?.let { usuarioRepository.findPerfilById(it).orElse(null) }

        // Los ingredientes "comunes" de la despensa del usuario cuentan como disponibles
        val ingredientesDespensa = usuario
            ?.ingredientesComunes()
            ?.map { it.nombre.lowercase() }
            ?: emptyList()

        val todosLosDisponibles = (ingredientesBuscados + ingredientesDespensa).distinct()

        // Ingredientes que el usuario configuró como "a evitar": los usamos para filtrar recetas
        val ingredientesAEvitar = usuario
            ?.ingredientesAEvitar()
            ?.map { it.nombre.lowercase() }
            ?: emptyList()

        val tipoDieta = usuario?.tipoDieta

        val recetasEncontradas = if (req.puedeComprar) {
            recetaRepository.findConAlgunIngrediente(todosLosDisponibles, tipoDieta, req.tiempoMaximo, ingredientesAEvitar)
        } else {
            recetaRepository.findConTodosLosIngredientes(todosLosDisponibles, tipoDieta, req.tiempoMaximo, ingredientesAEvitar)
        }

        val resultados = recetasEncontradas
            .map { receta -> calcularMatch(receta, todosLosDisponibles) }
            .filter { it.porcentajeMatch > 0 }
            .sortedByDescending { it.porcentajeMatch }

        return RecetaBusquedaResponse(
            recetas = resultados,
            totalResultados = resultados.size,
        )
    }

    private fun calcularMatch(
        receta: Receta,
        ingredientesDisponibles: List<String>,
    ): BusquedaRecetaDTO {
        val nombresReceta = receta.ingredientes.map { it.ingrediente.nombre.lowercase() }
        val faltantes = nombresReceta.filter { it !in ingredientesDisponibles }
        val coincidencias = nombresReceta.size - faltantes.size

        // cuántos ingredientes de la receta tiene el usuario sobre el total de la receta
        val porcentajeMatch = if (nombresReceta.isEmpty()) 0
            else (coincidencias * 100) / nombresReceta.size

        return BusquedaRecetaDTO(
            id = receta.id,
            nombre = receta.nombre,
            descripcion = receta.descripcion,
            tiempoEnMinutos = receta.tiempoEnMinutos,
            dificultad = receta.dificultad.label,
            tipoDieta = receta.tipoDieta.label,
            img = receta.imgUrl,
            cantidadIngredientes = nombresReceta.size,
            porcentajeMatch = porcentajeMatch,
            ingredientesFaltantes = faltantes,
            tags = receta.tags
        )
    }

    @Transactional(readOnly = true)
    fun getHistorial(usuarioId: UUID): List<Receta> {
        verificarUsuarioExiste(usuarioId)
        return historialRecetaRepository.findRecetasByUsuarioId(usuarioId)
    }

    @Transactional
    fun comenzarReceta(usuarioId: UUID, recetaId: Long): Receta {
        val usuario = buscarUsuarioConHistorial(usuarioId)
        val receta = recetaRepository.findWithDetailsById(recetaId)
            .orElseThrow { NotFoundException("Receta no encontrada") }

        usuario.comenzarReceta(receta)
        usuarioRepository.save(usuario)

        return receta
    }

    @Transactional(readOnly = true)
    fun getFavoritos(usuarioId: UUID): List<Receta> {
        verificarUsuarioExiste(usuarioId)
        return favoritoRecetaRepository.findRecetasByUsuarioId(usuarioId)
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
