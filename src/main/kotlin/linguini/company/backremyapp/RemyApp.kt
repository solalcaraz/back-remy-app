package linguini.company.backremyapp

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class RemyApp

fun main(args: Array<String>) {
	runApplication<RemyApp>(*args)
}
