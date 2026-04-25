package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.services.RecetaService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import java.util.UUID

@RestController
@CrossOrigin("*")
@RequestMapping("/receta")
class RecetaController(val recetaService: RecetaService) {
    @GetMapping("/{id}")
    fun getReceta(@PathVariable id: UUID): RecetaCompletaDTO {
        val receta = recetaService.getRecetaById(id)

        return recetaMapper.toFullDTO(receta)
    }
}