package linguini.company.backremyapp.dto

data class LoginRequest(
    val email: String,
    val password: String
)

data class RegisterRequest(
    val nombre: String,
    val email: String,
    val password: String
)

// Lo que se devuelve al registrarse (datos básicos del usuario, sin tokens)
data class RegisterResponseDTO(
    val id: java.util.UUID,
    val nombre: String,
    val email: String
)

// Lo que se devuelve al hacer login
data class AuthenticationResponse(
    val accessToken: String,
    val refreshToken: String
)

data class RefreshTokenRequest(
    val token: String
)

data class RefreshTokenResponse(
    val token: String
)