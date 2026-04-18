package linguini.company.backremyapp.domain
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
    private var password: String,
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

    fun quitarPreferenciaDeIngrediente(ingredienteId: Long) {
        preferenciasIngredientes.removeIf { it.ingrediente.id == ingredienteId }
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

    /* A chequear este method */
    fun actualizarNombre(nuevoNombre: String) {
        require(nuevoNombre.isNotBlank()) { "El nombre no puede estar vacío" }
        nombre = nuevoNombre.trim()
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
}

enum class TipoDieta {
    OMNIVORO,
    VEGETARIANO,
    VEGANO,
    CELIACO
}

enum class ObjetivoUsuario {
    INDIFERENTE,
    COMER_SALUDABLE,
    BAJAR_PESO,
    GANAR_MASA_MUSCULAR
}

enum class NivelCocina {
    BASICO,
    INTERMEDIO,
    AVANZADO
}

enum class PerfilEconomico {
    BAJO_PRESUPUESTO,
    INTERMEDIO,
    FLEXIBLE
}
