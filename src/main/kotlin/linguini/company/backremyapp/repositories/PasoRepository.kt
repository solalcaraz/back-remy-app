package linguini.company.backremyapp.repositories

import linguini.company.backremyapp.domain.Ingrediente
import org.springframework.data.jpa.repository.JpaRepository

interface PasoRepository : JpaRepository<Ingrediente, Long> {
}