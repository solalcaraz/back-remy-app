package linguini.company.backremyapp.security
import io.jsonwebtoken.Claims
import io.jsonwebtoken.Jwts
import io.jsonwebtoken.security.Keys
import linguini.company.backremyapp.domain.Usuario
import org.springframework.stereotype.Service
import java.util.Date
import java.util.UUID

/* Este TokenHelper nos aporta funciones básicas para la manipulación del token del usuario */
/* Crearlo, saber si expiró, si es válido, extraer los claims o el email. */

@Service
class TokenHelper(
    jwtProperties: JwtProperties,
) {
    private val secretKey = Keys.hmacShaKeyFor(
        jwtProperties.key.toByteArray(),
    )

    //No definimos roles por tipo de usuario como en phm. Dejo USER de forma estatica
    fun generateAccessToken(usuario: Usuario, expirationDate: Date): String =
        generate(
            userId = usuario.id!!,
            expirationDate = expirationDate,
            additionalClaims = mapOf(
                "role" to "USER",
                "type" to "access"
            )
        )

    fun generateRefreshToken(usuario: Usuario, expirationDate: Date): String =
        generate(
            userId = usuario.id!!,
            expirationDate = expirationDate,
            additionalClaims = mapOf(
                "type" to "refresh"
            )
        )

    fun extractType(token: String): String? =
        getAllClaims(token)["type"] as? String


    fun generate(
        userId: UUID,
        expirationDate: Date,
        additionalClaims: Map<String, Any> = emptyMap()
    ): String =
        Jwts.builder()
            .claims()
            .subject(userId.toString())
            .issuedAt(Date(System.currentTimeMillis()))
            .expiration(expirationDate)
            .add(additionalClaims)
            .and()
            .signWith(secretKey)
            .compact()

    fun extractUserId(token: String): UUID? {
        val subject = getAllClaims(token).subject ?: return null

        return try {
            UUID.fromString(subject)
        } catch (e: IllegalArgumentException) {
            null
        }
    }

    fun isExpired(token: String) : Boolean =
        getAllClaims(token).expiration.before(Date(System.currentTimeMillis()))

    fun isValid(token: String, userId: UUID): Boolean {
        val tokenUserId = extractUserId(token)

        return tokenUserId == userId && !isExpired(token)
    }

    private fun getAllClaims(token: String): Claims {
        val parser = Jwts.parser()
            .verifyWith(secretKey)
            .build()

        return parser.parseSignedClaims(token).payload
    }


}
