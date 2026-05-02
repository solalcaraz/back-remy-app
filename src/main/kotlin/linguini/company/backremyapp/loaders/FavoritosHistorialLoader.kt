package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.FavoritoReceta
import linguini.company.backremyapp.domain.HistorialReceta
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.FavoritoRecetaRepository
import linguini.company.backremyapp.repositories.HistorialRecetaRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.core.annotation.Order
import org.springframework.stereotype.Component

@Component
@Order(4)
class FavoritosHistorialLoader(
    private val usuarioRepository: UsuarioRepository,
    private val recetaRepository: RecetaRepository,
    private val favoritoRecetaRepository: FavoritoRecetaRepository,
    private val historialRecetaRepository: HistorialRecetaRepository
) : CommandLineRunner {
    override fun run(vararg args: String) {

        val usuario = usuarioRepository.findByEmail("diego@maradona.com")
            ?: throw NotFoundException("Usuario no encontrado")
        val receta = recetaRepository.findByNombre("Arroz con Pollo")
            ?: throw NotFoundException("Receta no encontrada")
        val receta2 = recetaRepository.findByNombre("Wok de Vegetales")
            ?: throw NotFoundException("Receta no encontrada")

        favoritoRecetaRepository.save(
            FavoritoReceta(
                usuario = usuario,
                receta = receta
            )
        )

        historialRecetaRepository.save(
            HistorialReceta(
                usuario = usuario,
                receta = receta2
            )
        )

        println("Favoritos e Historial cargados en Postgres")
    }
}
