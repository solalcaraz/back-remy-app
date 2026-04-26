package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.RecetaRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class RecetaService (
    private val recetaRepository: RecetaRepository
) {
    @Transactional(readOnly = true)
    fun getRecetaCompletaById(id: Long): Receta {
        val receta = recetaRepository.findWithDetailsById(id).orElseThrow { NotFoundException("Receta no encontrada") }

        return receta
    }

    //fun findAllByTipoDietaAndDificultad(tipoDieta: TipoDieta, dificultad: NivelCocina): List<Receta>
}