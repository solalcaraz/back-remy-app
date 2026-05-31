package linguini.company.backremyapp.domain

import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.ElementCollection
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.OneToMany
import jakarta.persistence.OrderBy
import jakarta.persistence.PrePersist
import jakarta.persistence.PreUpdate
import jakarta.persistence.Table

@Entity
@Table(name = "recetas")
class Receta(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @Column(nullable = false, length = 100)
    var nombre: String,

    @Column(nullable = false)
    var tiempoEnMinutos: Int = 0,

    @Column(nullable = false)
    var porciones: Int = 0,

    @Enumerated(EnumType.STRING)
    var dificultad: NivelCocina = NivelCocina.INTERMEDIO,

    @OneToMany(mappedBy = "receta", cascade = [CascadeType.ALL], orphanRemoval = true)
    var ingredientes: MutableSet<RecetaIngrediente> = mutableSetOf(),

    @OneToMany(mappedBy = "receta", cascade = [CascadeType.ALL], orphanRemoval = true)
    @OrderBy("orden ASC")
    var pasos: MutableSet<Paso> = mutableSetOf(),

    @ElementCollection
    var tags: MutableSet<String> = mutableSetOf(),
) {
    @Column(nullable = false, length = 500)
    var descripcion: String = ""

    @Column(name = "img_url", nullable = false)
    var imgUrl: String = ""

    @PrePersist
    @PreUpdate
    fun sincronizarDatosAutomaticos() {
        this.tiempoEnMinutos = calcularTiempo()
        this.dificultad = calcularDificultad()
    }

    val ingredientesCore: List<RecetaIngrediente>
        get() = ingredientes.filter { it.tipo == TipoIngredienteReceta.CORE }

    val ingredientesReemplazables: List<RecetaIngrediente>
        get() = ingredientes.filter { it.tipo == TipoIngredienteReceta.REEMPLAZABLE }

    val ingredientesOpcionales: List<RecetaIngrediente>
        get() = ingredientes.filter { it.tipo == TipoIngredienteReceta.OPCIONAL }

    fun calcularTiempo(): Int = pasos.sumOf { it.tiempoEstimadoMinutos }

    fun calcularDificultad(): NivelCocina {
        val puntaje = (pasos.size * 2) + (ingredientes.size * 1.5) + (tiempoEnMinutos / 10)

        return when {
            puntaje < 15 -> NivelCocina.BASICO
            puntaje < 30 -> NivelCocina.INTERMEDIO
            else -> NivelCocina.AVANZADO
        }
    }

    // Estos métodos también se podrían agregar al PrePersist y guardar el resultado en columnas
    fun caloriasTotales(): Double = ingredientes.sumOf { it.caloriasEstimadas() }

    fun grasasTotales(): Double = ingredientes.sumOf { it.grasasEstimadas() }

    fun proteinasTotales(): Double = ingredientes.sumOf { it.proteinasEstimadas() }

    fun fibrasTotales(): Double = ingredientes.sumOf { it.fibrasEstimadas() }

    fun restriccionesAlimentariasCumplidas(): Set<RestriccionAlimentaria> {
        if (ingredientes.isEmpty()) return emptySet()

        return ingredientes
            .map { it.ingrediente.restriccionesAlimentarias.toSet() }
            .reduce { acumuladas, restriccionesIngrediente ->
                acumuladas.intersect(restriccionesIngrediente)
            }
    }

    fun cumpleRestricciones(restricciones: Collection<RestriccionAlimentaria>): Boolean {
        return restricciones.all { restriccion ->
            ingredientes.all { recetaIngrediente ->
                recetaIngrediente.ingrediente.cumpleRestriccion(restriccion)
            }
        }
    }

    fun contieneIngredienteAEvitar(usuario: Usuario): Boolean {
        val ingredientesAEvitarIds = usuario.ingredientesAEvitar()
            .mapNotNull { it.id }
            .toSet()

        if (ingredientesAEvitarIds.isEmpty()) return false

        return ingredientes.any { recetaIngrediente ->
            recetaIngrediente.ingrediente.id in ingredientesAEvitarIds
        }
    }

    fun ingredientesCoincidentesCon(usuario: Usuario): Set<Ingrediente> {
        val ingredientesComunesIds = usuario.ingredientesComunes()
            .mapNotNull { it.id }
            .toSet()

        return ingredientes
            .map { it.ingrediente }
            .filter { it.id in ingredientesComunesIds }
            .toSet()
    }

    fun ingredientesFaltantesPara(usuario: Usuario): Set<Ingrediente> {
        val ingredientesComunesIds = usuario.ingredientesComunes()
            .mapNotNull { it.id }
            .toSet()

        return ingredientes
            .map { it.ingrediente }
            .filter { it.id !in ingredientesComunesIds }
            .toSet()
    }

    fun esCompatibleCon(usuario: Usuario): Boolean {
        return cumpleRestricciones(usuario.restriccionesAlimentarias) &&
            esCompatibleConObjetivo(usuario.objetivo) &&
            dificultad.ordinal <= usuario.nivelCocina.ordinal &&
            !contieneIngredienteAEvitar(usuario)
    }

    fun esCompatibleConObjetivo(objetivo: ObjetivoUsuario): Boolean {
        val kcal = caloriasTotales()
        val proteina = proteinasTotales()

        return when (objetivo) {
            ObjetivoUsuario.BAJAR_PESO -> kcal <= 500
            ObjetivoUsuario.GANAR_MASA_MUSCULAR -> proteina >= 25
            ObjetivoUsuario.COMER_SALUDABLE -> grasasTotales() <= 20 && fibrasTotales() >= 5
            ObjetivoUsuario.INDIFERENTE -> true
        }
    }

    fun agregarIngrediente(ingrediente: RecetaIngrediente) {
        ingredientes.add(ingrediente)
        ingrediente.receta = this
    }

    fun agregarPaso(paso: Paso) {
        pasos.add(paso)
        paso.receta = this
    }
}
