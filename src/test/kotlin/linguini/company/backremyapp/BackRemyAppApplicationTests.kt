package linguini.company.backremyapp

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest

@SpringBootTest(properties = ["security.key=clave-de-prueba-de-al-menos-32-caracteres"])
class BackRemyAppApplicationTests {

	@Test
	fun contextLoads() {
	}

}
