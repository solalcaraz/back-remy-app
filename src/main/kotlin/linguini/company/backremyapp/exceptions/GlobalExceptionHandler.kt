package linguini.company.backremyapp.exceptions

import linguini.company.backremyapp.dto.ErrorResponse
import org.springframework.beans.factory.annotation.Value
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RestControllerAdvice
import org.springframework.web.multipart.MaxUploadSizeExceededException
import org.springframework.web.multipart.MultipartException

@RestControllerAdvice
class GlobalExceptionHandler{
    @Value("\${spring.servlet.multipart.max-file-size}")
    lateinit var maxFileSize: String

    @ExceptionHandler(MaxUploadSizeExceededException::class)
    fun handleMaxSizeException(ex: MaxUploadSizeExceededException): ResponseEntity<ErrorResponse> {
        val response = ErrorResponse(
            status = 413,
            error = "Archivo demasiado grande",
            message = "La imagen no puede superar $maxFileSize"
        )

        return ResponseEntity(response, HttpStatus.PAYLOAD_TOO_LARGE)
    }
}