package linguini.company.backremyapp

import linguini.company.backremyapp.domain.CategoriaIngrediene
import linguini.company.backremyapp.domain.InfoNutricional
import linguini.company.backremyapp.domain.Ingrediente
import linguini.company.backremyapp.domain.Paso
import linguini.company.backremyapp.domain.Receta
import linguini.company.backremyapp.domain.RecetaIngrediente
import linguini.company.backremyapp.domain.RestriccionAlimentaria
import linguini.company.backremyapp.domain.TipoIngredienteReceta
import linguini.company.backremyapp.domain.UnidadMedida
import linguini.company.backremyapp.domain.Usuario

fun usuarioFixture(
    nombre: String = "Usuario Demo",
    email: String = "demo@remy.app"
) = Usuario(
    nombre = nombre,
    email = email,
    password = "hashed"
)

fun restriccionFixture(id: Long, nombre: String) = RestriccionAlimentaria(
    id = id,
    nombre = nombre
)

fun ingredienteFixture(
    id: Long,
    nombre: String,
    restricciones: MutableSet<RestriccionAlimentaria> = mutableSetOf(),
    infoNutricional: InfoNutricional? = null,
    categoria: CategoriaIngrediene = CategoriaIngrediene.OTROS_ESENCIALES
) = Ingrediente(
    id = id,
    nombre = nombre,
    unidadBase = UnidadMedida.GRAMOS,
    restriccionesAlimentarias = restricciones,
    infoNutricional = infoNutricional,
    categoria = categoria
)

fun infoNutricionalFixture(
    calorias: Double,
    proteinas: Double,
    carbohidratos: Double = 0.0,
    grasas: Double = 0.0,
    fibra: Double? = null
) = InfoNutricional(
    calorias = calorias,
    proteinas = proteinas,
    carbohidratos = carbohidratos,
    grasas = grasas,
    fibra = fibra,
    cantidadReferencia = 100.0,
    unidadReferencia = UnidadMedida.GRAMOS
)

fun recetaFixture(
    id: Long = 1,
    nombre: String = "Receta demo",
    porciones: Int = 2
) = Receta(
    id = id,
    nombre = nombre,
    porciones = porciones
)

fun recetaIngredienteFixture(
    ingrediente: Ingrediente,
    cantidad: Double,
    tipo: TipoIngredienteReceta = TipoIngredienteReceta.CORE,
    id: Long? = null
) = RecetaIngrediente(
    id = id,
    ingrediente = ingrediente,
    cantidad = cantidad,
    unidadMedida = UnidadMedida.GRAMOS,
    tipo = tipo
)

fun pasoFixture(
    orden: Int,
    tiempo: Int,
    titulo: String = "Paso $orden",
    descripcion: String = "Descripcion"
) = Paso(
    orden = orden,
    titulo = titulo,
    descripcion = descripcion,
    tiempoEstimadoMinutos = tiempo
)
