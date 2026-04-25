package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.RecetaRepository
import org.springframework.stereotype.Service
import java.util.UUID

@Service
class RecetaService (
    private val recetaRepository: RecetaRepository
) {
    fun getRecetaById(id: UUID): Receta {
        val receta = recetaRepository.findRecetaById(id).orElseThrow { NotFoundException("Receta no encontrada") }

        return receta
    }
}