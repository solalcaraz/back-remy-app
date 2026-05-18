package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.dto.RecetaCompletaDTO
import linguini.company.backremyapp.dto.RecomendacionRecetaDTO
import linguini.company.backremyapp.dto.RecomendacionRequest
import linguini.company.backremyapp.dto.ResumenRecetaDTO
import linguini.company.backremyapp.helpers.RecetaMapper
import linguini.company.backremyapp.services.RecomendacionService
import linguini.company.backremyapp.services.RecetaService
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.validation.annotation.Validated
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import java.util.UUID

@RestController
@CrossOrigin("*")
@RequestMapping("/receta")
class RecetaController(
    val recetaService: RecetaService,
    val recomendacionService: RecomendacionService,
    val recetaMapper: RecetaMapper
) {
    @GetMapping("/{id}")
    fun getRecetaCompleta(@PathVariable id: Long): RecetaCompletaDTO {
        val receta = recetaService.getRecetaCompletaById(id)

        return recetaMapper.toFullDTO(receta)
    }

    @GetMapping("/historial")
    fun getHistorial(@RequestParam usuarioId: UUID): List<ResumenRecetaDTO> {
        val recetas = recetaService.getHistorial(usuarioId)
        val favoritosIds = recetaService.getFavoritosIds(usuarioId)

        return recetaMapper.toRecetaResumenDTO(recetas, favoritosIds)
    }

    @PostMapping("/comenzar/{id}")
    fun comenzarReceta(@PathVariable id: Long, @RequestParam usuarioId: UUID) {
        recetaService.comenzarReceta(usuarioId, id)
    }

    @GetMapping("/favoritos")
    fun getFavoritos(@RequestParam usuarioId: UUID): List<ResumenRecetaDTO> {
        val recetas = recetaService.getFavoritos(usuarioId)

        return recetaMapper.toRecetaResumenDTO(recetas, null)
    }

    @PostMapping("/recomendaciones")
    fun getRecomendaciones(
        @RequestBody(required = false)
        req: RecomendacionRequest = RecomendacionRequest(),
    ): List<RecomendacionRecetaDTO> {
        val userId = SecurityContextHolder
            .getContext()
            .authentication
            ?.name.toString()

        return recomendacionService.recomendarRecetas(UUID.fromString(userId), req)
    }

    @PostMapping("/favorito/{id}")
    fun agregarFavorito(@PathVariable id: Long, @RequestParam usuarioId: UUID) {
        recetaService.agregarFavorito(usuarioId, id)
    }

    @DeleteMapping("/favorito/{id}")
    fun eliminarFavorito(@PathVariable id: Long, @RequestParam usuarioId: UUID) {
        recetaService.eliminarFavorito(usuarioId, id)
    }
}