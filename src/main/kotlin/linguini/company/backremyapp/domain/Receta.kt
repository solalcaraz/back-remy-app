package linguini.company.backremyapp.domain

import jakarta.persistence.*

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
    // Pensar en grupo: lógica para que se calculen solas por el peso de la comida

    @Enumerated(EnumType.STRING)
    var dificultad: NivelCocina = NivelCocina.INTERMEDIO, // Declarado en Usuario
    // Pensar en grupo: lógica para que se determine solo por cantidad de pasos, rareza de ingredientes, tiempo de cocina

    @OneToMany(mappedBy = "receta", cascade = [CascadeType.ALL], orphanRemoval = true)
    var ingredientes: MutableSet<RecetaIngrediente> = mutableSetOf(),

    @OneToMany(mappedBy = "receta", cascade = [CascadeType.ALL], orphanRemoval = true)
    @OrderBy("orden ASC")
    var pasos: MutableSet<Paso> = mutableSetOf(),

    @ElementCollection
    var tags: MutableSet<String> = mutableSetOf(),

    @Enumerated(EnumType.STRING)
    var tipoDieta: TipoDieta = TipoDieta.OMNIVORO // Declarado en Usuario
    // Pensar en grupo: lógica para que se determine solo por tipo de ingredientes
) {
    @Column(nullable = false, length = 500)
    var descripcion: String = ""

    @Column(name = "img_url", nullable = false)
    var imgUrl: String = ""

    @PrePersist
    @PreUpdate
    fun sincronizarDatosAutomaticos() {
        this.tiempoEnMinutos = calcularTiempo()
        //this.porciones = calcularPorciones()
        this.dificultad = calcularDificultad()
        //this.tipoDieta = determinarTipoDieta()
    }

    fun calcularTiempo() : Int = pasos.sumOf { it.tiempoEstimadoMinutos }

    //fun calcularPorciones() : Int = 0
    // Pensar en grupo regla de negocio.
    // Si es por el peso de los ingredientes, tener en cuenta un margen de error; además solo contar sólidos

    fun calcularDificultad(): NivelCocina {
        // Pensar en grupo regla de negocio. Por ahora:
        val puntaje = (pasos.size * 2) + (ingredientes.size * 1.5) + (tiempoEnMinutos / 10)

        return when {
            puntaje < 15 -> NivelCocina.BASICO
            puntaje < 30 -> NivelCocina.INTERMEDIO
            else -> NivelCocina.AVANZADO
        }
    }

    fun caloriasTotales(): Double = ingredientes.sumOf { it.caloriasEstimadas() }

    fun grasasTotales(): Double = ingredientes.sumOf { it.grasasEstimadas() }

    fun proteinasTotales(): Double = ingredientes.sumOf { it.proteinasEstimadas() }

    fun fibrasTotales(): Double = ingredientes.sumOf { it.fibrasEstimadas() }


    /*fun caloriasPorPorcion(): Double = caloriasTotales() / porciones*/

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

    /*fun esCompatibleConDieta(dieta: TipoDieta): Boolean {
        val ingredientesList = ingredientes.map { it.ingrediente }

        return when (dieta) {
            TipoDieta.VEGANO -> ingredientesList.all { it.esVegano() }
            TipoDieta.CELIACO -> ingredientesList.all { it.esVegano() }
            TipoDieta.VEGETARIANO -> ingredientesList.all { it.esVegano() }
            TipoDieta.OMNIVORO -> true
        }
    }*/

    fun agregarIngrediente(ingrediente: RecetaIngrediente) {
        ingredientes.add(ingrediente)
        ingrediente.receta = this
    }

    fun agregarPaso(paso: Paso) {
        pasos.add(paso)
        paso.receta = this
    }
}
