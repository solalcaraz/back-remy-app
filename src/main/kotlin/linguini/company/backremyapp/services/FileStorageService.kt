package linguini.company.backremyapp.services

import linguini.company.backremyapp.exceptions.BadRequestException
import org.springframework.stereotype.Service
import org.springframework.web.multipart.MultipartFile
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.file.StandardCopyOption
import java.util.UUID

@Service
class FileStorageService {

    private val uploadDir = Paths.get("uploads/usuarios")

    fun guardarFotoUsuario(usuarioId: UUID, file: MultipartFile): String {
        if (file.isEmpty) {
            throw BadRequestException("La imagen no puede estar vacía")
        }

        /*if (file.size > 1 * 1024 * 1024) {
            throw BadRequestException("La imagen no puede superar los 1MB")
        }*/

        val extension = file.originalFilename
            ?.substringAfterLast('.', "")
            ?.lowercase()
            ?.takeIf { it in listOf("jpg", "jpeg", "png", "webp") }
            ?: throw BadRequestException("Formato de imagen inválido")

        Files.createDirectories(uploadDir)

        val fileName = "$usuarioId.$extension"
        val destino = uploadDir.resolve(fileName)

        file.inputStream.use { input ->
            Files.copy(input, destino, StandardCopyOption.REPLACE_EXISTING)
        }

        return "/uploads/usuarios/$fileName"
    }
}