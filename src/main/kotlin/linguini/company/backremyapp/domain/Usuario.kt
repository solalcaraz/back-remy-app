package linguini.company.backremyapp.domain

import com.fasterxml.jackson.annotation.JsonValue
import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.FetchType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.JoinColumn
import jakarta.persistence.JoinTable
import jakarta.persistence.ManyToMany
import jakarta.persistence.OneToMany
import jakarta.persistence.Table
import linguini.company.backremyapp.exceptions.NotFoundException
import java.time.LocalDateTime
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

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "usuarios_restricciones_alimentarias",
        joinColumns = [JoinColumn(name = "usuario_id")],
        inverseJoinColumns = [JoinColumn(name = "restriccion_alimentaria_id")]
    )
    var restriccionesAlimentarias: MutableSet<RestriccionAlimentaria> = mutableSetOf()

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
    var favoritos: MutableSet<FavoritoReceta> = mutableSetOf()

    @OneToMany(
        fetch = FetchType.LAZY,
        mappedBy = "usuario",
        cascade = [CascadeType.ALL],
        orphanRemoval = true
    )
    var historial: MutableList<HistorialReceta> = mutableListOf()

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

        if (preferenciaExistente != null) {
            preferenciaExistente.tipo = tipo
            return
        }

        preferenciasIngredientes.add(
            PreferenciaIngredienteUsuario(
                usuario = this,
                ingrediente = ingrediente,
                tipo = tipo
            )
        )
    }

    fun cambiarRestriccionesAlimentarias(restricciones: Collection<RestriccionAlimentaria>) {
        restriccionesAlimentarias.clear()
        restriccionesAlimentarias.addAll(restricciones)
    }

    fun cambiarObjetivo(label: String) {
        objetivo = ObjetivoUsuario.entries.find { it.label == label }
            ?: throw IllegalArgumentException("Tipo de objetivo invalido: $label")
    }

    fun cambiarNivelCocina(label: String) {
        nivelCocina = NivelCocina.entries.find { it.label == label }
            ?: throw IllegalArgumentException("Tipo de nivel de cocina invalido: $label")
    }

    fun cambiarPerfilEconomico(label: String) {
        perfilEconomico = PerfilEconomico.entries.find { it.label == label }
            ?: throw IllegalArgumentException("Tipo de perfil economico invalido: $label")
    }

    fun agregarFavorito(receta: Receta) {
        if (favoritos.any { it.receta.id == receta.id }) {
            return
        }
        favoritos.add(FavoritoReceta(usuario = this, receta = receta))
    }

    fun eliminarFavorito(receta: Receta) {
        val favorito = favoritos.find { it.receta.id == receta.id }
            ?: throw NotFoundException("La receta no esta en favoritos")
        favoritos.remove(favorito)
    }

    fun comenzarReceta(receta: Receta) {
        val historialExistente = historial.find { it.receta.id == receta.id }

        if (historialExistente != null) {
            historialExistente.fechaInicio = LocalDateTime.now()
        } else {
            historial.add(
                HistorialReceta(
                    usuario = this,
                    receta = receta,
                    fechaInicio = LocalDateTime.now()
                )
            )
        }
    }
}

enum class ObjetivoUsuario(val label: String) {
    INDIFERENTE("Indiferente"),
    COMER_SALUDABLE("Comer mas saludable"),
    BAJAR_PESO("Bajar de peso"),
    GANAR_MASA_MUSCULAR("Ganar masa muscular");

    @JsonValue
    fun toJson() = label
}

enum class NivelCocina(val label: String) {
    BASICO("Basico"),
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
