package linguini.company.backremyapp.helpers

import java.text.Normalizer

fun normalizarNombre(nombre: String): String = nombre.trim().lowercase()

fun normalizarNombres(nombres: Collection<String>): Set<String> =
    nombres.map { normalizarNombre(it) }.filter { it.isNotBlank() }.toSet()

fun normalizarTexto(texto: String): String =
    Normalizer.normalize(texto.trim(), Normalizer.Form.NFD)
        .replace("\\p{M}+".toRegex(), "")
        .lowercase()
