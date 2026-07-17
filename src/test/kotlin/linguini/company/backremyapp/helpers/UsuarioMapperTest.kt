package linguini.company.backremyapp.helpers

import linguini.company.backremyapp.domain.ObjetivoUsuario
import linguini.company.backremyapp.domain.PerfilEconomico
import linguini.company.backremyapp.dto.UsuarioPatchRequest
import linguini.company.backremyapp.ingredienteFixture
import linguini.company.backremyapp.restriccionFixture
import linguini.company.backremyapp.usuarioFixture
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Test

class UsuarioMapperTest {
    private val mapper = UsuarioMapper("http://localhost:9000")

    @Test
    fun `toFullDTO expone labels y arma url absoluta de foto relativa`() {
        val usuario = usuarioFixture(nombre = "Ana", email = "ana@remy.app")
        usuario.fotoUrl = "/uploads/usuarios/ana.jpg"
        usuario.cambiarObjetivo("Comer mas saludable")
        usuario.cambiarNivelCocina("Avanzado")
        usuario.cambiarPerfilEconomico("Flexible")
        usuario.cambiarRestriccionesAlimentarias(listOf(restriccionFixture(1, "vegano")))
        usuario.agregarIngredienteComun(ingredienteFixture(1, "Tofu firme"))
        usuario.agregarIngredienteAEvitar(ingredienteFixture(2, "Leche entera"))

        val dto = mapper.toFullDTO(usuario)

        assertEquals("Ana", dto.nombre)
        assertEquals("ana@remy.app", dto.email)
        assertEquals("http://localhost:9000/uploads/usuarios/ana.jpg", dto.foto)
        assertEquals(setOf("vegano"), dto.restriccionesAlimentarias)
        assertEquals(ObjetivoUsuario.COMER_SALUDABLE.label, dto.objetivo)
        assertEquals(PerfilEconomico.FLEXIBLE.label, dto.perfilEconomico)
        assertEquals(setOf("Tofu firme"), dto.ingredientesComunes)
        assertEquals(setOf("Leche entera"), dto.ingredientesAEvitar)
    }

    @Test
    fun `toFullDTO no modifica foto absoluta ni inventa foto nula`() {
        val usuario = usuarioFixture()
        assertNull(mapper.toFullDTO(usuario).foto)

        usuario.fotoUrl = "https://cdn.remy.app/foto.jpg"

        assertEquals("https://cdn.remy.app/foto.jpg", mapper.toFullDTO(usuario).foto)
    }

    @Test
    fun `fromDTO actualiza campos editables del perfil`() {
        val usuario = usuarioFixture()
        val patch = UsuarioPatchRequest(
            nombre = "Lucas",
            foto = "/uploads/lucas.jpg",
            restriccionesAlimentarias = emptySet(),
            objetivo = "Bajar de peso",
            nivelCocina = "Avanzado",
            perfilEconomico = "Bajo presupuesto",
            ingredientesComunes = emptySet(),
            ingredientesAEvitar = emptySet()
        )

        mapper.fromDTO(patch, usuario)

        assertEquals("Lucas", usuario.nombre)
        assertEquals("/uploads/lucas.jpg", usuario.fotoUrl)
        assertEquals(ObjetivoUsuario.BAJAR_PESO, usuario.objetivo)
        assertEquals(PerfilEconomico.BAJO_PRESUPUESTO, usuario.perfilEconomico)
    }
}
