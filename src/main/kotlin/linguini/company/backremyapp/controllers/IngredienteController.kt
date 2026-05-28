package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.dto.BusquedaIngredientesSimilaresDTO
import linguini.company.backremyapp.dto.SugerirReemplazoIngredienteRequest
import linguini.company.backremyapp.services.IngredienteService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
@CrossOrigin("*")
@RequestMapping("/ingrediente")
class IngredienteController ( val ingredienteService: IngredienteService) {
    @GetMapping("/sugerencias")
    fun buscarTodos(@RequestParam q: String, @RequestParam(defaultValue = "5") limite: Int): List<String> {
        if (q.isBlank()) return emptyList()
        return ingredienteService.buscarPorNombre(q, limite)
    }

    @GetMapping("/similares")
    fun buscarSimilares(
        @RequestParam nombre: String,
        @RequestParam(defaultValue = "5") limite: Int
    ): BusquedaIngredientesSimilaresDTO {
        if (nombre.isBlank()) {
            return BusquedaIngredientesSimilaresDTO(nombreBuscado = nombre, encontrado = false)
        }

        return ingredienteService.topSimilares(nombre, limite)
    }

    @PostMapping("/reemplazos")
    fun sugerirReemplazo(
        @RequestBody req: SugerirReemplazoIngredienteRequest
    ): BusquedaIngredientesSimilaresDTO {
        if (req.nombreIngrediente.isBlank()) {
            return BusquedaIngredientesSimilaresDTO(nombreBuscado = req.nombreIngrediente, encontrado = false)
        }

        return ingredienteService.sugerirReemplazo(
            req.nombreIngrediente,
            req.restriccionesUsuario,
            req.limite
        )
    }
}
