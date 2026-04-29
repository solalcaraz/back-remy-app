package linguini.company.backremyapp.domain
import com.fasterxml.jackson.annotation.JsonValue
import jakarta.persistence.*
import java.util.UUID

@Entity
@Table(name = "usuarios")
class Usuario(
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    var id: UUID? = null,

    @Column(nullable = false, length = 100)
    var nombre: String,

    @Column(nullable = false, unique = true, length = 120)
    var email: String,

    @Column(nullable = false)
    var password: String,
) {
    @Column(name = "foto_url")
    var fotoUrl: String? = null

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_dieta", nullable = false)
    var tipoDieta: TipoDieta = TipoDieta.OMNIVORO

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    var objetivo: ObjetivoUsuario = ObjetivoUsuario.INDIFERENTE

    @Enumerated(EnumType.STRING)
    @Column(name = "nivel_cocina", nullable = false)
    var nivelCocina: NivelCocina = NivelCocina.BASICO

    @Enumerated(EnumType.STRING)
    @Column(name = "perfil_economico", nullable = false)
    var perfilEconomico: PerfilEconomico = PerfilEconomico.INTERMEDIO

    @OneToMany(
        fetch = FetchType.LAZY,
        mappedBy = "usuario",
        cascade = [CascadeType.ALL],
        orphanRemoval = true
    )
    var preferenciasIngredientes: MutableSet<PreferenciaIngredienteUsuario> = mutableSetOf()

    fun agregarIngredienteComun(ingrediente: Ingrediente) {
        guardarPreferencia(ingrediente, TipoPreferenciaIngrediente.COMUN)
    }

    fun agregarIngredienteAEvitar(ingrediente: Ingrediente) {
        guardarPreferencia(ingrediente, TipoPreferenciaIngrediente.EVITAR)
    }

    fun eliminarPreferenciasQueNoEstanEn(ingredientesIds: Set<Long>) {
        preferenciasIngredientes.removeIf { preferencia ->
            val ingredienteId = preferencia.ingrediente.id
            ingredienteId !in ingredientesIds
        }
    }

    fun ingredientesComunes(): Set<Ingrediente> {
        return preferenciasIngredientes
            .filter { it.tipo == TipoPreferenciaIngrediente.COMUN }
            .map { it.ingrediente }
            .toSet()
    }

    fun ingredientesAEvitar(): Set<Ingrediente> {
        return preferenciasIngredientes
            .filter { it.tipo == TipoPreferenciaIngrediente.EVITAR }
            .map { it.ingrediente }
            .toSet()
    }

    private fun guardarPreferencia(
        ingrediente: Ingrediente,
        tipo: TipoPreferenciaIngrediente
    ) {
        val preferenciaExistente = preferenciasIngredientes
            .find { it.ingrediente.id == ingrediente.id }

        /* Si ya tenía una preferencia de ese ingrediente,
        le actualizo el tipo nada más */
        if (preferenciaExistente != null) {
            preferenciaExistente.tipo = tipo
            return
        }

        /* Si no, la creo */
        preferenciasIngredientes.add(
            PreferenciaIngredienteUsuario(
                usuario = this,
                ingrediente = ingrediente,
                tipo = tipo
            )
        )
    }

    fun cambiarTipoDieta(label: String){
        tipoDieta = TipoDieta.entries.find { it.label == label }
            ?: throw IllegalArgumentException("Tipo de dieta inválido: $label")
    }
    fun cambiarObjetivo(label: String){
        objetivo = ObjetivoUsuario.entries.find { it.label == label }
            ?: throw IllegalArgumentException("Tipo de objetivo inválido: $label")
    }
    fun cambiarNivelCocina(label: String){
        nivelCocina = NivelCocina.entries.find { it.label == label }
            ?: throw IllegalArgumentException("Tipo de nivel de cocina inválido: $label")
    }
    fun cambiarPerfilEconomico(label: String){
        perfilEconomico = PerfilEconomico.entries.find { it.label == label }
            ?: throw IllegalArgumentException("Tipo de perfil económico inválido: $label")
    }
}

enum class TipoDieta(val label: String) {
    OMNIVORO("Omnívoro"),
    VEGETARIANO("Vegetariano"),
    VEGANO("Vegano"),
    CELIACO("Celíaco");

    @JsonValue
    fun toJson() = label
}

enum class ObjetivoUsuario(val label: String) {
    INDIFERENTE("Indiferente"),
    COMER_SALUDABLE("Comer más saludable"),
    BAJAR_PESO("Bajar de peso"),
    GANAR_MASA_MUSCULAR("Ganar masa muscular");

    @JsonValue
    fun toJson() = label
}

enum class NivelCocina(val label: String) {
    BASICO("Básico"),
    INTERMEDIO("Intermedio"),
    AVANZADO("Avanzado");

    @JsonValue
    fun toJson() = label
}

enum class PerfilEconomico(val label: String) {
    BAJO_PRESUPUESTO("Bajo presupuesto"),
    INTERMEDIO("Intermedio"),
    FLEXIBLE("Flexible");

    @JsonValue
    fun toJson() = label
}
