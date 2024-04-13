import io.kotest.core.spec.style.StringSpec
import io.kotest.matchers.shouldBe

class HelloTest : StringSpec({
    "greets the right person" {
        greet() shouldBe "Hello, World!"
    }
})
