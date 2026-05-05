package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.dto.PasoCompletoDTO
import linguini.company.backremyapp.services.PasoService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@CrossOrigin("*")
@RequestMapping("/paso")
class PasoController(private val pasoService: PasoService) {

    /* GET /paso/receta/{recetaId}
       Devuelve todos los pasos de una receta ordenados por 'orden' */
    @GetMapping("/receta/{recetaId}")
    fun getPasosByReceta(@PathVariable recetaId: Long): List<PasoCompletoDTO> {
        return pasoService.getPasosByRecetaId(recetaId).map { paso ->
            PasoCompletoDTO(
                id                    = paso.id,
                orden                 = paso.orden,
                titulo                = paso.titulo,
                descripcion           = paso.descripcion,
                detalle               = paso.detalle,
                tiempoEstimadoMinutos = paso.tiempoEstimadoMinutos,
                tip                   = paso.tip,
                imagenUrl             = paso.imagenUrl
            )
        }
    }
}