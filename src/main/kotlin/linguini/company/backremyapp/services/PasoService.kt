package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.Paso
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.PasoRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class PasoService(
    private val pasoRepository: PasoRepository,
    private val recetaRepository: RecetaRepository
) {
    @Transactional(readOnly = true)
    fun getPasosByRecetaId(recetaId: Long): List<Paso> {
        /* Verificamos que la receta exista antes de buscar sus pasos */
        if (!recetaRepository.existsById(recetaId)) {
            throw NotFoundException("Receta no encontrada con id: $recetaId")
        }

        return pasoRepository.findByRecetaIdOrderByOrden(recetaId)
    }
}