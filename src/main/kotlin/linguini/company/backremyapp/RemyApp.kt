package linguini.company.backremyapp

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import java.util.TimeZone

@SpringBootApplication
class RemyApp

fun main(args: Array<String>) {
	System.setProperty("user.timezone", "America/Argentina/Buenos_Aires")
	TimeZone.setDefault(TimeZone.getTimeZone("America/Argentina/Buenos_Aires"))
	runApplication<RemyApp>(*args)
}
