package linguini.company.backremyapp.services

import linguini.company.backremyapp.exceptions.BadRequestException
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import org.springframework.web.multipart.MultipartFile
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.file.StandardCopyOption
import java.util.UUID

@Service
class FileStorageService(
    @Value("\${app.upload-dir}")
    private val uploadDirPath: String
) {

    private val uploadDir = Paths.get(uploadDirPath)

    fun guardarFotoUsuario(usuarioId: UUID, file: MultipartFile): String {
        if (file.isEmpty) {
            throw BadRequestException("La imagen no puede estar vacía")
        }

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
