package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.dto.RecetaCompletaDTO
import linguini.company.backremyapp.dto.RecomendacionRecetaDTO
import linguini.company.backremyapp.dto.ResumenRecetaDTO
import linguini.company.backremyapp.helpers.RecetaMapper
import linguini.company.backremyapp.services.RecomendacionService
import linguini.company.backremyapp.services.RecetaService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
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
    fun comenzarReceta(@PathVariable id: Long, @RequestParam usuarioId: UUID): RecetaCompletaDTO {
        val receta = recetaService.comenzarReceta(usuarioId, id)

        return recetaMapper.toFullDTO(receta)
    }

    @GetMapping("/favoritos")
    fun getFavoritos(@RequestParam usuarioId: UUID): List<ResumenRecetaDTO> {
        val recetas = recetaService.getFavoritos(usuarioId)

        return recetaMapper.toRecetaResumenDTO(recetas, null)
    }

    @GetMapping("/recomendaciones")
    fun getRecomendaciones(
        @RequestParam usuarioId: UUID,
        @RequestParam(defaultValue = "10") limite: Int
    ): List<RecomendacionRecetaDTO> {
        return recomendacionService.recomendarRecetas(usuarioId, limite)
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
