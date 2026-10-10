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
import java.text.Normalizer

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

    @Column(name = "costo_total_compra", nullable = false)
    var costoTotalCompra: Double = 0.0

    @Enumerated(EnumType.STRING)
    @Column(name = "perfil_economico", nullable = false)
    var perfilEconomico: PerfilEconomico = PerfilEconomico.INTERMEDIO

    @PrePersist
    @PreUpdate
    fun sincronizarDatosAutomaticos() {
        this.tiempoEnMinutos = calcularTiempo()
        this.dificultad = calcularDificultad()
    }

    fun calcularTiempo(): Int = pasos.sumOf { it.tiempoEstimadoMinutos }

    fun calcularDificultad(): NivelCocina {
        val puntaje = (pasos.size * 1.5) +
            ingredientes.size +
            (tiempoEnMinutos / 20) +
            puntajePorTecnicas()

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
    
    fun carbohidratosTotales(): Double = ingredientes.sumOf { it.carbsEstimadas() }

    fun caloriasPorPorcion(): Double = caloriasTotales() / porcionesSeguras()

    fun grasasPorPorcion(): Double = grasasTotales() / porcionesSeguras()

    fun proteinasPorPorcion(): Double = proteinasTotales() / porcionesSeguras()

    fun fibrasPorPorcion(): Double = fibrasTotales() / porcionesSeguras()

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
            recetaIngrediente.tipo == TipoIngredienteReceta.CORE &&
                recetaIngrediente.ingrediente.id in ingredientesAEvitarIds
        }
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
        val proteina = proteinasPorPorcion()

        return when (objetivo) {
            ObjetivoUsuario.BAJAR_PESO -> esAdecuadaParaBajarPeso()
            ObjetivoUsuario.GANAR_MASA_MUSCULAR -> proteina >= 25
            ObjetivoUsuario.COMER_SALUDABLE -> esAdecuadaParaComerSaludable()
            ObjetivoUsuario.INDIFERENTE -> true
        }
    }

    private fun esAdecuadaParaBajarPeso(): Boolean {
        return caloriasPorPorcion() <= MAX_CALORIAS_BAJAR_PESO &&
            grasasPorPorcion() <= MAX_GRASAS_BAJAR_PESO &&
            (fibrasPorPorcion() >= MIN_FIBRAS_BAJAR_PESO || proteinasPorPorcion() >= MIN_PROTEINAS_BAJAR_PESO)
    }

    private fun esAdecuadaParaComerSaludable(): Boolean {
        return caloriasPorPorcion() <= MAX_CALORIAS_COMER_SALUDABLE &&
            grasasPorPorcion() <= MAX_GRASAS_COMER_SALUDABLE &&
            fibrasPorPorcion() >= MIN_FIBRAS_COMER_SALUDABLE &&
            proteinasPorPorcion() >= MIN_PROTEINAS_COMER_SALUDABLE
    }

    private fun porcionesSeguras(): Int = porciones.coerceAtLeast(1)

    private fun puntajePorTecnicas(): Int {
        val texto = textoTecnicoNormalizado()

        return TECNICAS_DIFICULTAD.sumOf { tecnica ->
            if (tecnica.palabrasClave.any { it in texto }) tecnica.puntos else 0
        }
    }

    private fun textoTecnicoNormalizado(): String {
        val pasosTexto = pasos.joinToString(" ") { paso ->
            listOfNotNull(paso.titulo, paso.descripcion, paso.detalle, paso.tip).joinToString(" ")
        }
        val texto = listOf(nombre, descripcion, tags.joinToString(" "), pasosTexto).joinToString(" ")

        return Normalizer.normalize(texto, Normalizer.Form.NFD)
            .replace("\\p{M}+".toRegex(), "")
            .lowercase()
    }

    private companion object {
        const val MAX_CALORIAS_BAJAR_PESO = 500
        const val MAX_GRASAS_BAJAR_PESO = 18
        const val MIN_FIBRAS_BAJAR_PESO = 4
        const val MIN_PROTEINAS_BAJAR_PESO = 12
        const val MAX_CALORIAS_COMER_SALUDABLE = 700
        const val MAX_GRASAS_COMER_SALUDABLE = 20
        const val MIN_FIBRAS_COMER_SALUDABLE = 5
        const val MIN_PROTEINAS_COMER_SALUDABLE = 8

        val TECNICAS_DIFICULTAD = listOf(
            TecnicaDificultad(16, listOf("wok", "fuego fuerte")),
            TecnicaDificultad(14, listOf("berenjenas rellenas", "dahl", "falafel", "guiso de lentejas", "locro", "ratatouille")),
            TecnicaDificultad(12, listOf("sushi", "enrollar firme")),
            TecnicaDificultad(7, listOf("risotto", "agregar caldo", "absorba antes de agregar")),
            TecnicaDificultad(4, listOf("masa fermentada", "levar")),
            TecnicaDificultad(4, listOf("tarta", "empanada", "repulgue", "rellenar tapas", "forrar molde")),
            TecnicaDificultad(4, listOf("milanesa", "empanar", "rebozar", "freir")),
            TecnicaDificultad(3, listOf("rellenar", "relleno", "gratinar", "reducir los jugos")),
            TecnicaDificultad(2, listOf("wok", "saltear por tandas", "fuego fuerte")),
            TecnicaDificultad(1, listOf("amasar", "hornear", "sofreir", "saltear"))
        )
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

private data class TecnicaDificultad(
    val puntos: Int,
    val palabrasClave: List<String>
)
