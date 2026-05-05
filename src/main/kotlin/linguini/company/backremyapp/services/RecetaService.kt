package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.TipoDieta
import linguini.company.backremyapp.dto.RecetaBusquedaRequest
import linguini.company.backremyapp.dto.RecetaBusquedaResponse
import linguini.company.backremyapp.dto.ResumenRecetaDTO
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

    //fun findAllByTipoDietaAndDificultad(tipoDieta: TipoDieta, dificultad: NivelCocina): List<Receta>

    @Transactional(readOnly = true)
    fun buscarRecetas(req: RecetaBusquedaRequest): RecetaBusquedaResponse {
        val ingredientesNormalizados = req.ingredientes.map { it.trim().lowercase() }
        val tipoDieta = req.tipoDieta?.let { label ->
            TipoDieta.entries.find { it.label == label }
        }

        val recetasEncontradas = recetaRepository.findByIngredientesAndFiltros(
            nombresIngredientes = ingredientesNormalizados,
            tipoDieta = tipoDieta,
            tiempoMaximo = req.tiempoMaximo
        )

        val recetasOrdenadas = recetasEncontradas
            .map { receta -> calcularMatch(receta, ingredientesNormalizados, req.puedeComprar) }
            .filter { it.porcentajeMatch > 0 }
            .sortedByDescending { it.porcentajeMatch }

        return RecetaBusquedaResponse(
            recetas = recetasOrdenadas,
            totalResultados = recetasOrdenadas.size,
            busquedaId = UUID.randomUUID().toString()
        )
    }

    /*
     * Calcula qué porcentaje de los ingredientes de la receta están
     * cubiertos por lo que el usuario tiene disponible.
     *
     * Ejemplo: receta tiene 5 ingredientes, el usuario tiene 3 → 60%.
     * Si puedeComprar = true, los faltantes no penalizan tanto (se considera
     * que los puede conseguir), por eso el match sube al 80% mínimo si ya
     * tiene al menos uno. Esto es una regla de negocio provisional: ajustar
     * con el grupo según el criterio que definan.
     */
    private fun calcularMatch(
        receta: Receta,
        ingredientesDisponibles: List<String>,
        puedeComprar: Boolean
    ): ResumenRecetaDTO {
        val nombresReceta = receta.ingredientes.map { it.ingrediente.nombre.lowercase() }
        val faltantes = nombresReceta.filter { it !in ingredientesDisponibles }
        val coincidencias = nombresReceta.size - faltantes.size

        val porcentajeBase = if (nombresReceta.isEmpty()) 0
        else (coincidencias * 100) / nombresReceta.size

        val porcentajeFinal = when {
            puedeComprar && coincidencias > 0 -> maxOf(porcentajeBase, 80)
            else -> porcentajeBase
        }

        return ResumenRecetaDTO(
            id = receta.id,
            nombre = receta.nombre,
            descripcion = "",                          // campo pendiente en el dominio
            tiempoEnMinutos = receta.tiempoEnMinutos,
            dificultad = receta.dificultad.label,
            cantidadIngredientes = nombresReceta.size,
            porcentajeMatch = porcentajeFinal,
            ingredientesFaltantes = faltantes,
            tags = receta.tags,
            tipoDieta = receta.tipoDieta.label
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
