package linguini.company.backremyapp.services

import linguini.company.backremyapp.repositories.IngredienteRepository
import org.springframework.data.domain.PageRequest
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class IngredienteService(val ingredienteRepository: IngredienteRepository) {
    @Transactional(readOnly = true)
    fun buscarPorNombre(query: String, limite: Int): List<String> {
        val pageable = PageRequest.of(0, limite)
        return ingredienteRepository.buscarNombres(query.trim(), pageable)
    }
}