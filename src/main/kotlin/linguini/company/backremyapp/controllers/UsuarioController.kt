package linguini.company.backremyapp.controllers
import linguini.company.backremyapp.dto.FotoPatchResponse
import linguini.company.backremyapp.dto.UsuarioCompletoDTO
import linguini.company.backremyapp.dto.UsuarioPatchRequest
import linguini.company.backremyapp.helpers.UsuarioMapper
import linguini.company.backremyapp.services.UsuarioService
import org.springframework.http.MediaType
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
    @GetMapping("/{id}")
    fun getUsuario(@PathVariable id: UUID): UsuarioCompletoDTO {
        val user = usuarioService.getUsuarioById(id)

        return usuarioMapper.toFullDTO(user)
    }

    @PatchMapping("/{id}")
    fun updateUsuario(@PathVariable id: UUID, @RequestBody userPatch: UsuarioPatchRequest) {
        return usuarioService.updateUsuario(id, userPatch)
    }

    @PatchMapping("/{id}/foto", consumes = [MediaType.MULTIPART_FORM_DATA_VALUE])
    fun updateFotoUsuario(
        @PathVariable id: UUID,
        @RequestParam("foto") foto: MultipartFile
    ): FotoPatchResponse {
        return usuarioService.updateFotoUsuario(id, foto)
    }
}