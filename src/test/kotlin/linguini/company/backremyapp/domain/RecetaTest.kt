package linguini.company.backremyapp.domain

import linguini.company.backremyapp.ingredienteFixture
import linguini.company.backremyapp.infoNutricionalFixture
import linguini.company.backremyapp.pasoFixture
import linguini.company.backremyapp.recetaFixture
import linguini.company.backremyapp.recetaIngredienteFixture
import linguini.company.backremyapp.restriccionFixture
import linguini.company.backremyapp.usuarioFixture
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

class RecetaTest {
    @Test
    fun `agregar ingrediente y paso sincroniza relaciones bidireccionales`() {
        val receta = recetaFixture()
        val ingredienteReceta = recetaIngredienteFixture(ingredienteFixture(1, "Arroz"), 100.0)
        val paso = pasoFixture(1, 10)

        receta.agregarIngrediente(ingredienteReceta)
        receta.agregarPaso(paso)

        assertEquals(receta, ingredienteReceta.receta)
        assertEquals(receta, paso.receta)
        assertEquals(setOf(ingredienteReceta), receta.ingredientes)
        assertEquals(setOf(paso), receta.pasos)
    }

    @Test
    fun `calcula tiempo dificultad y nutrientes totales por porcion`() {
        val receta = recetaFixture(porciones = 2)
        receta.agregarPaso(pasoFixture(1, 10))
        receta.agregarPaso(pasoFixture(2, 15))
        receta.agregarIngrediente(
            recetaIngredienteFixture(
                ingredienteFixture(
                    1,
                    "Lentejas",
                    infoNutricional = infoNutricionalFixture(
                        calorias = 120.0,
                        proteinas = 9.0,
                        carbohidratos = 20.0,
                        grasas = 1.0,
                        fibra = 8.0
                    )
                ),
                cantidad = 200.0
            )
        )

        receta.sincronizarDatosAutomaticos()

        assertEquals(25, receta.tiempoEnMinutos)
        assertEquals(NivelCocina.BASICO, receta.dificultad)
        assertEquals(240.0, receta.caloriasTotales())
        assertEquals(120.0, receta.caloriasPorPorcion())
        assertEquals(18.0, receta.proteinasTotales())
        assertEquals(8.0, receta.fibrasPorPorcion())
    }

    @Test
    fun `cumple restricciones solo si todos los ingredientes las cumplen`() {
        val vegano = restriccionFixture(1, "vegano")
        val receta = recetaFixture()
        receta.agregarIngrediente(
            recetaIngredienteFixture(
                ingredienteFixture(1, "Tofu", mutableSetOf(vegano)),
                100.0
            )
        )
        receta.agregarIngrediente(
            recetaIngredienteFixture(
                ingredienteFixture(2, "Arroz", mutableSetOf(vegano)),
                100.0
            )
        )

        assertTrue(receta.cumpleRestricciones(listOf(vegano)))

        receta.agregarIngrediente(recetaIngredienteFixture(ingredienteFixture(3, "Queso"), 50.0))

        assertFalse(receta.cumpleRestricciones(listOf(vegano)))
    }

    @Test
    fun `detecta ingrediente core a evitar pero ignora opcionales`() {
        val usuario = usuarioFixture()
        val ajo = ingredienteFixture(1, "Ajo")
        val queso = ingredienteFixture(2, "Queso")
        usuario.agregarIngredienteAEvitar(ajo)
        usuario.agregarIngredienteAEvitar(queso)

        val receta = recetaFixture()
        receta.agregarIngrediente(recetaIngredienteFixture(ajo, 5.0, TipoIngredienteReceta.OPCIONAL))

        assertFalse(receta.contieneIngredienteAEvitar(usuario))

        receta.agregarIngrediente(recetaIngredienteFixture(queso, 80.0, TipoIngredienteReceta.CORE))

        assertTrue(receta.contieneIngredienteAEvitar(usuario))
    }

    @Test
    fun `compatibilidad con usuario cruza restricciones objetivo dificultad y evitados`() {
        val vegano = restriccionFixture(1, "vegano")
        val tofu = ingredienteFixture(
            id = 1,
            nombre = "Tofu",
            restricciones = mutableSetOf(vegano),
            infoNutricional = infoNutricionalFixture(calorias = 180.0, proteinas = 30.0, grasas = 8.0)
        )
        val receta = recetaFixture(porciones = 1)
        receta.dificultad = NivelCocina.INTERMEDIO
        receta.agregarIngrediente(recetaIngredienteFixture(tofu, 100.0))

        val usuario = usuarioFixture()
        usuario.cambiarObjetivo("Ganar masa muscular")
        usuario.cambiarNivelCocina("Avanzado")
        usuario.cambiarRestriccionesAlimentarias(listOf(vegano))

        assertTrue(receta.esCompatibleCon(usuario))

        usuario.agregarIngredienteAEvitar(tofu)

        assertFalse(receta.esCompatibleCon(usuario))
    }
}
