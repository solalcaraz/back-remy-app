package linguini.company.backremyapp.loaders
//
//import linguini.company.backremyapp.domain.FavoritoReceta
//import linguini.company.backremyapp.domain.HistorialReceta
//import linguini.company.backremyapp.domain.Receta
//import linguini.company.backremyapp.domain.Usuario
//import linguini.company.backremyapp.exceptions.NotFoundException
//import linguini.company.backremyapp.repositories.FavoritoRecetaRepository
//import linguini.company.backremyapp.repositories.HistorialRecetaRepository
//import linguini.company.backremyapp.repositories.RecetaRepository
//import linguini.company.backremyapp.repositories.UsuarioRepository
//import org.springframework.boot.CommandLineRunner
//import org.springframework.core.annotation.Order
//import org.springframework.stereotype.Component
//
//@Component
//@Order(6)
//class FavoritosHistorialLoader(
//    private val usuarioRepository: UsuarioRepository,
//    private val recetaRepository: RecetaRepository,
//    private val favoritoRecetaRepository: FavoritoRecetaRepository,
//    private val historialRecetaRepository: HistorialRecetaRepository
//) : CommandLineRunner {
//    override fun run(vararg args: String) {
//        if (favoritoRecetaRepository.count() > 0 && historialRecetaRepository.count() > 0) return
//
//        val diego = usuario("diego@maradona.com")
//        val ana = usuario("ana@remy.app")
//        val martina = usuario("martina@remy.app")
//        val lucas = usuario("lucas@remy.app")
//
//        val arrozConPollo = receta("Arroz con Pollo")
//        val wok = receta("Wok de Vegetales")
//        val guiso = receta("Guiso de Lentejas")
//        val omelette = receta("Omelette con Queso")
//        val avena = receta("Avena con Yogur")
//        val ensalada = receta("Ensalada Tibia de Papa")
//        val carne = receta("Carne con Pure")
//        val arrozBrocoli = receta("Arroz con Brocoli")
//
//        if (favoritoRecetaRepository.count() == 0L) {
//            favoritoRecetaRepository.saveAll(
//                listOf(
//                    FavoritoReceta(usuario = diego, receta = arrozConPollo),
//                    FavoritoReceta(usuario = diego, receta = omelette),
//                    FavoritoReceta(usuario = ana, receta = wok),
//                    FavoritoReceta(usuario = ana, receta = guiso),
//                    FavoritoReceta(usuario = martina, receta = arrozConPollo),
//                    FavoritoReceta(usuario = martina, receta = carne),
//                    FavoritoReceta(usuario = lucas, receta = avena),
//                    FavoritoReceta(usuario = lucas, receta = ensalada)
//                )
//            )
//        }
//
//        if (historialRecetaRepository.count() == 0L) {
//            historialRecetaRepository.saveAll(
//                listOf(
//                    HistorialReceta(usuario = diego, receta = wok),
//                    HistorialReceta(usuario = diego, receta = carne),
//                    HistorialReceta(usuario = ana, receta = arrozBrocoli),
//                    HistorialReceta(usuario = ana, receta = avena),
//                    HistorialReceta(usuario = martina, receta = omelette),
//                    HistorialReceta(usuario = martina, receta = arrozConPollo),
//                    HistorialReceta(usuario = lucas, receta = ensalada),
//                    HistorialReceta(usuario = lucas, receta = guiso)
//                )
//            )
//        }
//
//        println("Favoritos e historial cargados en Postgres")
//    }
//
//    private fun usuario(email: String): Usuario {
//        return usuarioRepository.findByEmail(email)
//            ?: throw NotFoundException("Usuario no encontrado: $email")
//    }
//
//    private fun receta(nombre: String): Receta {
//        return recetaRepository.findByNombre(nombre)
//            ?: throw NotFoundException("Receta no encontrada: $nombre")
//    }
//}
