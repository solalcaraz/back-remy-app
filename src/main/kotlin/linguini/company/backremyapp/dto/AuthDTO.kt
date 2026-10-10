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

data class RegisterResponseDTO(
    val id: java.util.UUID,
    val nombre: String,
    val email: String
)

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