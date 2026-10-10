package linguini.company.backremyapp.controllers
import linguini.company.backremyapp.dto.FotoPatchResponse
import linguini.company.backremyapp.dto.UsuarioCompletoDTO
import linguini.company.backremyapp.dto.UsuarioPatchRequest
import linguini.company.backremyapp.helpers.UsuarioMapper
import linguini.company.backremyapp.security.usuarioAutenticadoId
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

@RestController
@CrossOrigin("*")
@RequestMapping("/usuario")
class UsuarioController(val usuarioService: UsuarioService, val usuarioMapper: UsuarioMapper) {
    @GetMapping("/me")
    fun getUsuario(): UsuarioCompletoDTO {
        val user = usuarioService.getUsuarioById(usuarioAutenticadoId())

        return usuarioMapper.toFullDTO(user)
    }

    @PatchMapping("/me")
    fun updateUsuario(@RequestBody userPatch: UsuarioPatchRequest) {
        return usuarioService.updateUsuario(usuarioAutenticadoId(), userPatch)
    }

    @PatchMapping("/me/foto", consumes = [MediaType.MULTIPART_FORM_DATA_VALUE])
    fun updateFotoUsuario(
        @RequestParam("foto") foto: MultipartFile
    ): FotoPatchResponse {
        return usuarioService.updateFotoUsuario(usuarioAutenticadoId(), foto)
    }
}