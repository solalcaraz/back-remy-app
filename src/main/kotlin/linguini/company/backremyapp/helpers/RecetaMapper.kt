package linguini.company.backremyapp.helpers

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.TipoIngredienteReceta
import linguini.company.backremyapp.dto.InfoNutricionalDTO
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
        restriccionesUsuario: Set<String>,
        favorito: Boolean = false
    ): RecetaCompletaDTO

    fun toRecetaResumenDTO(recetas: List<Receta>, favoritosIds: Set<Long>?): List<ResumenRecetaDTO>
}

@Service
class RecetaMapper(
    private val ingredienteService: IngredienteService
) : RecetaAdapter {
    override fun toFullDTO(receta: Receta): RecetaCompletaDTO =
        toFullDTO(receta, emptySet(), emptySet(), emptySet(), favorito = false)

    override fun toFullDTO(
        receta: Receta,
        ingredientesFaltantes: Set<String>,
        ingredientesAEvitar: Set<String>,
        restriccionesUsuario: Set<String>,
        favorito: Boolean
    ): RecetaCompletaDTO {
        val faltantesNormalizados = normalizarNombres(ingredientesFaltantes)
        val aEvitarNormalizados = normalizarNombres(ingredientesAEvitar)
        // filtra los ingredientes opcionales que esten en a evitar
        val ingredientes = receta.ingredientes
            .filterNot {
                it.tipo == TipoIngredienteReceta.OPCIONAL &&
                    normalizarNombre(it.ingrediente.nombre) in aEvitarNormalizados
            }
        val nombresIngredientesReceta = ingredientes.map { it.ingrediente.nombre }.toSet()

        // si es faltante (o a evitar) devuelve las sugerencias
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
                    it.tipo.name,
                    reemplazo,
                    InfoNutricionalDTO(
                        calorias = it.caloriasEstimadas(),
                        proteinas = it.proteinasEstimadas(),
                        carbohidratos = it.carbsEstimadas(),
                        grasas = it.grasasEstimadas()
                    )
                )
            },
            pasos = receta.pasos.map {
                ResumenPasoDTO(it.id, it.orden, it.titulo, it.descripcion, it.tiempoEstimadoMinutos)
            },
            tags = receta.tags,
            restriccionesAlimentarias = receta.restriccionesAlimentariasCumplidas().map { it.nombre }.toSet(),
            imgUrl = receta.imgUrl,
            favorito = favorito,
            infoNutricional = InfoNutricionalDTO(
                calorias = receta.caloriasTotales(),
                proteinas = receta.proteinasTotales(),
                carbohidratos = receta.carbohidratosTotales(),
                grasas = receta.grasasTotales()
            )
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

    companion object {
        private const val LIMITE_REEMPLAZOS = 5
    }
}
