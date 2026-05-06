package linguini.company.backremyapp.loaders

import linguini.company.backremyapp.domain.NivelCocina
import linguini.company.backremyapp.domain.ObjetivoUsuario
import linguini.company.backremyapp.domain.PerfilEconomico
import linguini.company.backremyapp.domain.RestriccionAlimentaria
import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.exceptions.NotFoundException
import linguini.company.backremyapp.repositories.IngredienteRepository
import linguini.company.backremyapp.repositories.RestriccionAlimentariaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import org.springframework.boot.CommandLineRunner
import org.springframework.core.annotation.Order
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Component

@Component
@Order(3)
class UsuarioLoader(
    private val usuarioRepository: UsuarioRepository,
    private val ingredienteRepository: IngredienteRepository,
    private val restriccionAlimentariaRepository: RestriccionAlimentariaRepository,
    private val encoder: PasswordEncoder
) : CommandLineRunner {
    override fun run(vararg args: String) {
        if (usuarioRepository.count() > 0) return

        val vegetariano = restriccion("Vegetariano")
        val vegano = restriccion("Vegano")
        val sinGluten = restriccion("Sin gluten")
        val sinLactosa = restriccion("Sin lactosa")

        val cebolla = ingrediente("cebolla")
        val queso = ingrediente("queso")
        val morron = ingrediente("morron")
        val ajo = ingrediente("ajo")
        val pimienta = ingrediente("pimienta")
        val azucar = ingrediente("azucar")
        val pollo = ingrediente("pollo")
        val arroz = ingrediente("arroz")
        val brocoli = ingrediente("brocoli")
        val lentejas = ingrediente("lentejas")
        val tomate = ingrediente("tomate")
        val huevo = ingrediente("huevo")
        val leche = ingrediente("leche")
        val avena = ingrediente("avena")
        val papa = ingrediente("papa")
        val carne = ingrediente("carne vacuna")
        val yogur = ingrediente("yogur natural")

        val diego = usuario(
            nombre = "Diego Maradona",
            email = "diego@maradona.com",
            objetivo = ObjetivoUsuario.INDIFERENTE,
            nivel = NivelCocina.BASICO,
            perfil = PerfilEconomico.INTERMEDIO,
            restricciones = mutableSetOf(sinGluten)
        ).apply {
            agregarIngredienteComun(cebolla)
            agregarIngredienteComun(queso)
            agregarIngredienteComun(morron)
            agregarIngredienteComun(ajo)
            agregarIngredienteAEvitar(pimienta)
            agregarIngredienteAEvitar(azucar)
        }

        val ana = usuario(
            nombre = "Ana Vegana",
            email = "ana@remy.app",
            objetivo = ObjetivoUsuario.COMER_SALUDABLE,
            nivel = NivelCocina.INTERMEDIO,
            perfil = PerfilEconomico.BAJO_PRESUPUESTO,
            restricciones = mutableSetOf(vegetariano, vegano, sinLactosa)
        ).apply {
            agregarIngredienteComun(arroz)
            agregarIngredienteComun(brocoli)
            agregarIngredienteComun(lentejas)
            agregarIngredienteComun(tomate)
            agregarIngredienteAEvitar(queso)
            agregarIngredienteAEvitar(leche)
        }

        val martina = usuario(
            nombre = "Martina Fitness",
            email = "martina@remy.app",
            objetivo = ObjetivoUsuario.GANAR_MASA_MUSCULAR,
            nivel = NivelCocina.AVANZADO,
            perfil = PerfilEconomico.FLEXIBLE,
            restricciones = mutableSetOf(sinGluten)
        ).apply {
            agregarIngredienteComun(pollo)
            agregarIngredienteComun(arroz)
            agregarIngredienteComun(huevo)
            agregarIngredienteComun(yogur)
            agregarIngredienteAEvitar(papa)
        }

        val lucas = usuario(
            nombre = "Lucas Simple",
            email = "lucas@remy.app",
            objetivo = ObjetivoUsuario.BAJAR_PESO,
            nivel = NivelCocina.BASICO,
            perfil = PerfilEconomico.INTERMEDIO,
            restricciones = mutableSetOf()
        ).apply {
            agregarIngredienteComun(avena)
            agregarIngredienteComun(leche)
            agregarIngredienteComun(huevo)
            agregarIngredienteComun(carne)
            agregarIngredienteAEvitar(ajo)
        }

        usuarioRepository.saveAll(listOf(diego, ana, martina, lucas))
        println("Usuarios cargados en Postgres")
    }

    private fun usuario(
        nombre: String,
        email: String,
        objetivo: ObjetivoUsuario,
        nivel: NivelCocina,
        perfil: PerfilEconomico,
        restricciones: MutableSet<RestriccionAlimentaria>
    ) = Usuario(
        nombre = nombre,
        email = email,
        password = encoder.encode("admin")!!
    ).apply {
        this.objetivo = objetivo
        this.nivelCocina = nivel
        this.perfilEconomico = perfil
        this.restriccionesAlimentarias = restricciones
    }

    private fun ingrediente(nombre: String) =
        ingredienteRepository.findByNombre(nombre) ?: throw NotFoundException("Ingrediente no encontrado: $nombre")

    private fun restriccion(nombre: String) =
        restriccionAlimentariaRepository.findByNombre(nombre)
            ?: throw NotFoundException("Restriccion alimentaria no encontrada: $nombre")
}
