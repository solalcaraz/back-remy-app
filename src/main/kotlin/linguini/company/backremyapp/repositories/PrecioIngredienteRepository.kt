package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.PrecioIngrediente
import org.springframework.data.jpa.repository.JpaRepository

interface PrecioIngredienteRepository : JpaRepository<PrecioIngrediente, Long>
