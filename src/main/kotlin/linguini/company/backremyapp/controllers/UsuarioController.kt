package linguini.company.backremyapp.controllers
import linguini.company.backremyapp.dto.FotoPatchResponse
import linguini.company.backremyapp.dto.UsuarioCompletoDTO
import linguini.company.backremyapp.dto.UsuarioPatchRequest
import linguini.company.backremyapp.helpers.UsuarioMapper
import linguini.company.backremyapp.services.UsuarioService
import org.springframework.http.MediaType
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PatchMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.multipart.MultipartFile
import java.util.UUID

@RestController
@CrossOrigin("*")
@RequestMapping("/usuario")
class UsuarioController(val usuarioService: UsuarioService, val usuarioMapper: UsuarioMapper) {
    @GetMapping("/me")
    fun getUsuario(): UsuarioCompletoDTO {
        val userId = SecurityContextHolder
            .getContext()
            .authentication
            ?.name.toString()

        val user = usuarioService.getUsuarioById(UUID.fromString(userId))

        return usuarioMapper.toFullDTO(user)
    }

    @PatchMapping("/me")
    fun updateUsuario(@RequestBody userPatch: UsuarioPatchRequest) {
        val userId = SecurityContextHolder
            .getContext()
            .authentication
            ?.name.toString()

        return usuarioService.updateUsuario(UUID.fromString(userId), userPatch)
    }

    @PatchMapping("/me/foto", consumes = [MediaType.MULTIPART_FORM_DATA_VALUE])
    fun updateFotoUsuario(
        @RequestParam("foto") foto: MultipartFile
    ): FotoPatchResponse {
        val userId = SecurityContextHolder
            .getContext()
            .authentication
            ?.name.toString()

        return usuarioService.updateFotoUsuario(UUID.fromString(userId), foto)
    }
}