package linguini.company.backremyapp.helpers

import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.dto.IngredienteRecetaDTO
import linguini.company.backremyapp.dto.RecetaCompletaDTO
import linguini.company.backremyapp.dto.ResumenPasoDTO
import linguini.company.backremyapp.dto.ResumenRecetaDTO
import org.springframework.stereotype.Service

interface RecetaAdapter {
    fun toFullDTO(receta: Receta): RecetaCompletaDTO

    fun toRecetaResumenDTO(recetas: List<Receta>, favoritosIds: Set<Long>?): List<ResumenRecetaDTO>
}

@Service
class RecetaMapper: RecetaAdapter {
    override fun toFullDTO(receta: Receta): RecetaCompletaDTO {
        return RecetaCompletaDTO(
            id = receta.id,
            nombre = receta.nombre,
            tiempoEnMinutos = receta.tiempoEnMinutos,
            porciones = receta.porciones,
            dificultad = receta.dificultad.label,
            ingredientes = receta.ingredientes.map {
                IngredienteRecetaDTO(it.id, it.ingrediente.nombre, it.cantidad, it.unidadMedida.label)
            },
            pasos = receta.pasos.map {
                ResumenPasoDTO(it.id, it.orden, it.titulo, it.descripcion, it.tiempoEstimadoMinutos)
            },
            tags = receta.tags,
            tipoDieta = receta.tipoDieta.label
        )
    }

    override fun toRecetaResumenDTO(recetas: List<Receta>, favoritosIds: Set<Long>?): List<ResumenRecetaDTO> {
        return recetas.map { receta ->
            val favorito = favoritosIds?.let { ids -> receta.id in ids} ?: true
            ResumenRecetaDTO(
                id = receta.id,
                titulo = receta.nombre,
                descripcion = receta.descripcion,
                tiempoEstimadoMinutos = receta.tiempoEnMinutos,
                tipoReceta = receta.tipoDieta.label,
                img = receta.imgUrl,
                favorito
            )
        }
    }
}
