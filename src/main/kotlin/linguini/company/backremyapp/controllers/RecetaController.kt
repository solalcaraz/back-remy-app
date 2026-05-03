package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.dto.RecetaBusquedaRequest
import linguini.company.backremyapp.dto.RecetaBusquedaResponse
import linguini.company.backremyapp.dto.RecetaCompletaDTO
import linguini.company.backremyapp.helpers.RecetaMapper
import linguini.company.backremyapp.services.RecetaService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@CrossOrigin("*")
@RequestMapping("/receta")
class RecetaController(val recetaService: RecetaService, val recetaMapper: RecetaMapper) {
    @GetMapping("/{id}")
    fun getRecetaCompleta(@PathVariable id: Long): RecetaCompletaDTO {
        val receta = recetaService.getRecetaCompletaById(id)

        return recetaMapper.toFullDTO(receta)
    }

    @PostMapping("/buscar")
    fun buscarRecetas(@RequestBody req: RecetaBusquedaRequest): RecetaBusquedaResponse {
        return recetaService.buscarRecetas(req)
    }
}