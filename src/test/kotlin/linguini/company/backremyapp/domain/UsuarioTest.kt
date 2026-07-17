package linguini.company.backremyapp.domain

import linguini.company.backremyapp.ingredienteFixture
import linguini.company.backremyapp.restriccionFixture
import linguini.company.backremyapp.usuarioFixture
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Test

class UsuarioTest {
    @Test
    fun `agregar ingrediente comun y a evitar reemplaza preferencia existente`() {
        val usuario = usuarioFixture()
        val cebolla = ingredienteFixture(1, "Cebolla")

        usuario.agregarIngredienteComun(cebolla)
        usuario.agregarIngredienteAEvitar(cebolla)

        assertEquals(emptySet<Ingrediente>(), usuario.ingredientesComunes())
        assertEquals(setOf(cebolla), usuario.ingredientesAEvitar())
        assertEquals(1, usuario.preferenciasIngredientes.size)
    }

    @Test
    fun `eliminar preferencias que no estan en la seleccion conserva solo las finales`() {
        val usuario = usuarioFixture()
        val arroz = ingredienteFixture(1, "Arroz")
        val lentejas = ingredienteFixture(2, "Lentejas")

        usuario.agregarIngredienteComun(arroz)
        usuario.agregarIngredienteAEvitar(lentejas)

        usuario.eliminarPreferenciasQueNoEstanEn(setOf(2))

        assertEquals(emptySet<Ingrediente>(), usuario.ingredientesComunes())
        assertEquals(setOf(lentejas), usuario.ingredientesAEvitar())
    }

    @Test
    fun `cambiar labels normaliza tildes y espacios`() {
        val usuario = usuarioFixture()

        usuario.cambiarObjetivo("Ganar masa muscular")
        usuario.cambiarNivelCocina("Avanzado")
        usuario.cambiarPerfilEconomico("Bajo presupuesto")

        assertEquals(ObjetivoUsuario.GANAR_MASA_MUSCULAR, usuario.objetivo)
        assertEquals(NivelCocina.AVANZADO, usuario.nivelCocina)
        assertEquals(PerfilEconomico.BAJO_PRESUPUESTO, usuario.perfilEconomico)
    }

    @Test
    fun `cambiar labels invalidos lanza excepcion`() {
        val usuario = usuarioFixture()

        assertThrows(IllegalArgumentException::class.java) {
            usuario.cambiarObjetivo("objetivo imposible")
        }
    }

    @Test
    fun `cambiar restricciones reemplaza la seleccion anterior`() {
        val usuario = usuarioFixture()
        val vegano = restriccionFixture(1, "vegano")
        val sinGluten = restriccionFixture(2, "sin_gluten")

        usuario.cambiarRestriccionesAlimentarias(listOf(vegano))
        usuario.cambiarRestriccionesAlimentarias(listOf(sinGluten))

        assertEquals(setOf(sinGluten), usuario.restriccionesAlimentarias)
    }
}
