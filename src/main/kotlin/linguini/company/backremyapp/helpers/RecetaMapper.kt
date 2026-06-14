package linguini.company.backremyapp.helpers

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.TipoIngredienteReceta
import linguini.company.backremyapp.dto.IngredienteRecetaDTO
import linguini.company.backremyapp.dto.RecetaCompletaDTO
import linguini.company.backremyapp.dto.ResumenPasoDTO
import linguini.company.backremyapp.dto.ResumenRecetaDTO
import linguini.company.backremyapp.services.IngredienteService
import org.springframework.stereotype.Service

interface RecetaAdapter {
    fun toFullDTO(receta: Receta): RecetaCompletaDTO

    fun toFullDTO(
        receta: Receta,
        ingredientesFaltantes: Set<String>,
        ingredientesAEvitar: Set<String>,
        restriccionesUsuario: Set<String>
    ): RecetaCompletaDTO

    fun toRecetaResumenDTO(recetas: List<Receta>, favoritosIds: Set<Long>?): List<ResumenRecetaDTO>
}

@Service
class RecetaMapper(
    private val ingredienteService: IngredienteService
) : RecetaAdapter {
    override fun toFullDTO(receta: Receta): RecetaCompletaDTO {
        return RecetaCompletaDTO(
            id = receta.id,
            nombre = receta.nombre,
            tiempoEnMinutos = receta.tiempoEnMinutos,
            porciones = receta.porciones,
            dificultad = receta.dificultad.label,
            ingredientes = receta.ingredientes.map {
                IngredienteRecetaDTO(it.id, it.ingrediente.nombre, it.cantidad, it.unidadMedida.name)
            },
            pasos = receta.pasos.map {
                ResumenPasoDTO(it.id, it.orden, it.titulo, it.descripcion, it.tiempoEstimadoMinutos)
            },
            tags = receta.tags,
            restriccionesAlimentarias = receta.restriccionesAlimentariasCumplidas().map { it.nombre }.toSet(),
            imgUrl = receta.imgUrl
        )
    }

    override fun toFullDTO(
        receta: Receta,
        ingredientesFaltantes: Set<String>,
        ingredientesAEvitar: Set<String>,
        restriccionesUsuario: Set<String>
    ): RecetaCompletaDTO {
        val faltantesNormalizados = normalizarNombres(ingredientesFaltantes)
        val aEvitarNormalizados = normalizarNombres(ingredientesAEvitar)
        val ingredientes = receta.ingredientes
            .filterNot {
                it.tipo == TipoIngredienteReceta.OPCIONAL &&
                    normalizarNombre(it.ingrediente.nombre) in aEvitarNormalizados
            }
        val nombresIngredientesReceta = ingredientes.map { it.ingrediente.nombre }.toSet()

        return RecetaCompletaDTO(
            id = receta.id,
            nombre = receta.nombre,
            tiempoEnMinutos = receta.tiempoEnMinutos,
            porciones = receta.porciones,
            dificultad = receta.dificultad.label,
            ingredientes = ingredientes.map {
                val nombreNormalizado = normalizarNombre(it.ingrediente.nombre)
                val reemplazo = if (nombreNormalizado in faltantesNormalizados) {
                    ingredienteService.sugerirReemplazo(
                        it.ingrediente.nombre,
                        restriccionesUsuario,
                        LIMITE_REEMPLAZOS,
                        nombresIngredientesReceta
                    )
                } else {
                    null
                }

                IngredienteRecetaDTO(
                    it.id,
                    it.ingrediente.nombre,
                    it.cantidad,
                    it.unidadMedida.name,
                    reemplazo
                )
            },
            pasos = receta.pasos.map {
                ResumenPasoDTO(it.id, it.orden, it.titulo, it.descripcion, it.tiempoEstimadoMinutos)
            },
            tags = receta.tags,
            restriccionesAlimentarias = receta.restriccionesAlimentariasCumplidas().map { it.nombre }.toSet(),
            imgUrl = receta.imgUrl
        )
    }

    override fun toRecetaResumenDTO(recetas: List<Receta>, favoritosIds: Set<Long>?): List<ResumenRecetaDTO> {
        return recetas.map { receta ->
            val favorito = favoritosIds?.let { ids -> receta.id?.let { it in ids } == true } ?: true
            ResumenRecetaDTO(
                id = receta.id,
                nombre = receta.nombre,
                descripcion = receta.descripcion,
                tiempoEnMinutos = receta.tiempoEnMinutos,
                tags = receta.tags,
                imgUrl = receta.imgUrl,
                favorito
            )
        }
    }

    private fun normalizarNombres(nombres: Set<String>): Set<String> {
        return nombres
            .map { normalizarNombre(it) }
            .filter { it.isNotBlank() }
            .toSet()
    }

    private fun normalizarNombre(nombre: String): String {
        return nombre.trim().lowercase()
    }

    companion object {
        private const val LIMITE_REEMPLAZOS = 5
    }
}
