package linguini.company.backremyapp.controllers

import linguini.company.backremyapp.dto.AuthenticationResponse
import linguini.company.backremyapp.dto.LoginRequest
import linguini.company.backremyapp.dto.RefreshTokenRequest
import linguini.company.backremyapp.dto.RefreshTokenResponse
import linguini.company.backremyapp.dto.RegisterRequest
import linguini.company.backremyapp.dto.RegisterResponseDTO
import linguini.company.backremyapp.exceptions.ForbiddenException
import linguini.company.backremyapp.services.AuthService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@CrossOrigin("*")
@RequestMapping("/auth")
class AuthController(
    private val authService: AuthService
) {
    @PostMapping("/login")
    fun login(@RequestBody request: LoginRequest): AuthenticationResponse =
        authService.login(request)

    @PostMapping("/register")
    fun register(@RequestBody request: RegisterRequest): RegisterResponseDTO {
        val usuario = authService.register(request)
        return RegisterResponseDTO(
            id = usuario.id!!,
            nombre = usuario.nombre,
            email = usuario.email
        )
    }

    @PostMapping("/refresh")
    fun refresh(@RequestBody request: RefreshTokenRequest): RefreshTokenResponse {
        println(request)
        return authService.refreshToken(request.token)?.maptoTokenResponse()?: throw ForbiddenException("Refresh token invalido")
    }

    private fun String.maptoTokenResponse(): RefreshTokenResponse =
        RefreshTokenResponse(token = this)
}