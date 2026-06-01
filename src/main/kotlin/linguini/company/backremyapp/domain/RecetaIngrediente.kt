package linguini.company.backremyapp.domain

import jakarta.persistence.*

@Entity
@Table(name = "receta_ingredientes")
class RecetaIngrediente(
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receta_id")
    var receta: Receta? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ingrediente_id")
    var ingrediente: Ingrediente,

    var cantidad: Double,

    @Enumerated(EnumType.STRING)
    var unidadMedida: UnidadMedida,

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_ingrediente", nullable = false, length = 20)
    var tipo: TipoIngredienteReceta = TipoIngredienteReceta.CORE
) {
    fun caloriasEstimadas(): Double {
        val info = ingrediente.infoNutricional ?: return 0.0
        return info.calorias * cantidad / info.cantidadReferencia
    }

    fun proteinasEstimadas(): Double {
        val info = ingrediente.infoNutricional ?: return 0.0
        return info.proteinas * cantidad / info.cantidadReferencia
    }

    fun carbsEstimadas(): Double {
        val info = ingrediente.infoNutricional ?: return 0.0
        return info.carbohidratos * cantidad / info.cantidadReferencia
    }

    fun grasasEstimadas(): Double {
        val info = ingrediente.infoNutricional ?: return 0.0
        return info.grasas * cantidad / info.cantidadReferencia
    }

    fun fibrasEstimadas(): Double {
        val fibra = ingrediente.infoNutricional?.fibra ?: return 0.0
        val info = ingrediente.infoNutricional ?: return 0.0

        return fibra * cantidad / info.cantidadReferencia
    }

    /* y llamarlo en el service? */
//    fun costoEstimado(precio: PrecioIngrediente): Double {
//        return precio.precio.toDouble() * cantidad / precio.cantidadReferencia.toDouble()
//    }
    // No tenemos cantidades de referencia
}

enum class TipoIngredienteReceta {
    CORE,
    REEMPLAZABLE,
    OPCIONAL
}
