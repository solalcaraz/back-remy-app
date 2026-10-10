package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.dto.RecetaCompletaDTO
import linguini.company.backremyapp.dto.RecomendacionPaginadaDTO
import linguini.company.backremyapp.dto.RecomendacionRequest
import linguini.company.backremyapp.dto.ResumenRecetaDTO
import linguini.company.backremyapp.dto.SugerenciaDiariaDTO
import linguini.company.backremyapp.helpers.RecetaMapper
import linguini.company.backremyapp.security.usuarioAutenticadoId
import linguini.company.backremyapp.services.RecomendacionService
import linguini.company.backremyapp.services.RecetaService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@CrossOrigin("*")
@RequestMapping("/receta")
class RecetaController(
    val recetaService: RecetaService,
    val recomendacionService: RecomendacionService,
    val recetaMapper: RecetaMapper
) {
    @GetMapping("/{id}")
    fun getRecetaCompleta(
        @PathVariable id: Long,
        @RequestParam(required = false) ingredientesFaltantes: Set<String>?
    ): RecetaCompletaDTO {
        val usuarioId = usuarioAutenticadoId()
        val receta = recetaService.getRecetaCompletaById(id)
        val usuario = recetaService.getPerfilUsuario(usuarioId)

        val faltantesReales = ingredientesFaltantes?.takeIf { it.isNotEmpty() }
            ?: receta.ingredientesFaltantesPara(usuario).map { it.nombre }.toSet()
        val favoritosIds = recetaService.getFavoritosIds(usuarioId)
        val favorito = receta.id?.let { it in favoritosIds } == true

        return recetaMapper.toFullDTO(
            receta,
            faltantesReales,
            usuario.ingredientesAEvitar().map { it.nombre }.toSet(),
            usuario.restriccionesAlimentarias.map { it.nombre }.toSet(),
            favorito
        )
    }

    @GetMapping("/historial")
    fun getHistorial(): List<ResumenRecetaDTO> {
        val usuarioId = usuarioAutenticadoId()
        val recetas = recetaService.getHistorial(usuarioId)
        val favoritosIds = recetaService.getFavoritosIds(usuarioId)

        return recetaMapper.toRecetaResumenDTO(recetas, favoritosIds)
    }

    @PostMapping("/comenzar/{id}")
    fun comenzarReceta(@PathVariable id: Long) {
        recetaService.comenzarReceta(usuarioAutenticadoId(), id)
    }

    @GetMapping("/favoritos")
    fun getFavoritos(): List<ResumenRecetaDTO> {
        val usuarioId = usuarioAutenticadoId()
        val recetas = recetaService.getFavoritos(usuarioId)

        return recetaMapper.toRecetaResumenDTO(recetas, null)
    }

    @PostMapping("/recomendaciones")
    fun getRecomendaciones(
        @RequestBody(required = false)
        req: RecomendacionRequest = RecomendacionRequest(),
        @RequestParam(defaultValue = "0")
        page: Int
    ): RecomendacionPaginadaDTO {
        return recomendacionService.recomendarRecetas(usuarioAutenticadoId(), req, page)
    }

    @GetMapping("/sugerencia-diaria")
    fun getSugerenciaDiaria(): SugerenciaDiariaDTO {
        return recomendacionService.sugerenciaDiaria(usuarioAutenticadoId())
    }

    @GetMapping("/sugerencias")
    fun getSugerenciasPorNombre(
        @RequestParam query: String,
        @RequestParam(defaultValue = "5") limite: Int
    ): List<ResumenRecetaDTO> {
        val favoritosIds = recetaService.getFavoritosIds(usuarioAutenticadoId())
        val recetas = recetaService.sugerirRecetasPorNombre(query, limite)

        return recetaMapper.toRecetaResumenDTO(recetas, favoritosIds)
    }

    @PostMapping("/favorito/{id}")
    fun agregarFavorito(@PathVariable id: Long) {
        recetaService.agregarFavorito(usuarioAutenticadoId(), id)
    }

    @DeleteMapping("/favorito/{id}")
    fun eliminarFavorito(@PathVariable id: Long) {
        recetaService.eliminarFavorito(usuarioAutenticadoId(), id)
    }
}
