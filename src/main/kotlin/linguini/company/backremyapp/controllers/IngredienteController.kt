package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.services.IngredienteService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
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
}