package linguini.company.backremyapp.services

import linguini.company.backremyapp.domain.ObjetivoUsuario
import linguini.company.backremyapp.domain.PerfilEconomico
import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.Usuario
import linguini.company.backremyapp.dto.RecomendacionRecetaDTO
import linguini.company.backremyapp.helpers.RecetaMapper
import linguini.company.backremyapp.repositories.FavoritoRecetaRepository
import linguini.company.backremyapp.repositories.HistorialRecetaRepository
import linguini.company.backremyapp.repositories.RecetaRepository
import linguini.company.backremyapp.repositories.UsuarioRepository
import linguini.company.backremyapp.exceptions.NotFoundException
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.util.UUID

@Service
class RecomendacionService(
    private val usuarioRepository: UsuarioRepository,
    private val recetaRepository: RecetaRepository,
    private val favoritoRecetaRepository: FavoritoRecetaRepository,
    private val historialRecetaRepository: HistorialRecetaRepository,
    private val recetaMapper: RecetaMapper
) {
    /* Así encaró el tema de la recomendación codex, no está teniendo en cuenta los inputs del home porque no sabe
    el contexto del front salvo el de mi vista, agregale la logica de tus inputs y condimentalo como vos quieras @Sol */
    /* Lo de devolver el objeto con puntaje y lista de badges me pareció genial, pero esta hecho con zaraza creo */
    /* No sé cómo va a ser llevar esto a SQL, veamos si es facil si no lo dejamos asi chupando todas las recetas */
    @Transactional(readOnly = true)
    fun recomendarRecetas(usuarioId: UUID, limite: Int = 10): List<RecomendacionRecetaDTO> {
        val usuario = usuarioRepository.findPerfilById(usuarioId)
            .orElseThrow { NotFoundException("Usuario no encontrado") }
        /* Acá estamos trayendo todas las recetas y filtrando en memoria, llevarlo a query sql
        de ser posible */
        val recetas = recetaRepository.findAllWithDetailsBy()
        val favoritosIds = favoritoRecetaRepository.findRecetaIdsByUsuarioId(usuarioId)
        val historialIds = historialRecetaRepository.findRecetasByUsuarioId(usuarioId)
            .mapNotNull { it.id }
            .toSet()

        /* Creo que acá está siendo muy rígido filtrando solo las compatibles en TODO */
        return recetas
            .filter { it.esCompatibleCon(usuario) }
            .map { receta ->
                val evaluacion = evaluarReceta(receta, usuario, favoritosIds, historialIds)
                RecomendacionRecetaDTO(
                    receta = recetaMapper.toRecetaResumenDTO(listOf(receta), favoritosIds).first(),
                    puntaje = evaluacion.puntaje,
                    motivos = evaluacion.motivos,
                    ingredientesCoincidentes = receta.ingredientesCoincidentesCon(usuario).map { it.nombre }.toSet(),
                    ingredientesFaltantes = receta.ingredientesFaltantesPara(usuario).map { it.nombre }.toSet()
                )
            }
            .sortedWith(compareByDescending<RecomendacionRecetaDTO> { it.puntaje }.thenBy { it.receta.tiempoEstimadoMinutos })
            .take(limite.coerceIn(1, 50))
    }

    private fun evaluarReceta(
        receta: Receta,
        usuario: Usuario,
        favoritosIds: Set<Long>,
        historialIds: Set<Long>
    ): EvaluacionRecomendacion {
        var puntaje = 0
        val motivos = mutableListOf<String>()

        val coincidencias = receta.ingredientesCoincidentesCon(usuario)
        val faltantes = receta.ingredientesFaltantesPara(usuario)

        if (coincidencias.isNotEmpty()) {
            val puntos = coincidencias.size * 20
            puntaje += puntos
            motivos.add("Usa ${coincidencias.size} ingrediente(s) comun(es) del usuario")
        }

        if (faltantes.isEmpty() && receta.ingredientes.isNotEmpty()) {
            puntaje += 30
            motivos.add("El usuario ya tiene todos los ingredientes principales cargados como comunes")
        } else {
            puntaje -= faltantes.size * 8
        }

        if (receta.cumpleRestricciones(usuario.restriccionesAlimentarias)) {
            puntaje += 25
            motivos.add("Cumple las restricciones alimentarias del usuario")
        }

        if (receta.esCompatibleConObjetivo(usuario.objetivo)) {
            puntaje += puntosPorObjetivo(usuario.objetivo)
            motivos.add("Acompaña el objetivo actual del usuario")
        }

        if (receta.dificultad.ordinal <= usuario.nivelCocina.ordinal) {
            puntaje += 15
            motivos.add("La dificultad encaja con el nivel de cocina del usuario")
        }

        if (receta.id?.let { it in favoritosIds } == true) {
            puntaje += 10
            motivos.add("Ya esta marcada como favorita")
        }

        if (receta.id?.let { it in historialIds } == true) {
            puntaje -= 10
            motivos.add("Ya fue cocinada recientemente")
        }

        puntaje += puntosPorPerfilEconomico(usuario.perfilEconomico, faltantes.size)
        puntaje += puntosPorTiempo(receta.tiempoEnMinutos)

        return EvaluacionRecomendacion(puntaje, motivos)
    }

    private fun puntosPorObjetivo(objetivo: ObjetivoUsuario): Int {
        return when (objetivo) {
            ObjetivoUsuario.INDIFERENTE -> 5
            ObjetivoUsuario.COMER_SALUDABLE -> 20
            ObjetivoUsuario.BAJAR_PESO -> 20
            ObjetivoUsuario.GANAR_MASA_MUSCULAR -> 20
        }
    }

    private fun puntosPorPerfilEconomico(perfilEconomico: PerfilEconomico, ingredientesFaltantes: Int): Int {
        return when (perfilEconomico) {
            PerfilEconomico.BAJO_PRESUPUESTO -> -ingredientesFaltantes * 10
            PerfilEconomico.INTERMEDIO -> -ingredientesFaltantes * 4
            PerfilEconomico.FLEXIBLE -> 0
        }
    }

    private fun puntosPorTiempo(tiempoEnMinutos: Int): Int {
        return when {
            tiempoEnMinutos <= 20 -> 10
            tiempoEnMinutos <= 45 -> 5
            else -> 0
        }
    }
}

private data class EvaluacionRecomendacion(
    val puntaje: Int,
    val motivos: List<String>
)
