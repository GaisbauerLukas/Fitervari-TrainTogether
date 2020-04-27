package at.htl_leonding.control

import at.htl_leonding.model.Person
import io.quarkus.runtime.StartupEvent
import java.time.LocalDate
import java.util.logging.Logger
import javax.enterprise.context.ApplicationScoped
import javax.enterprise.event.Observes
import javax.inject.Inject
import javax.transaction.Transactional

@ApplicationScoped
class InitBean {

    //TODO Figure this out

    @Transactional
    fun init(@Observes event: StartupEvent?) {
        print("====================================================================")


    }
}