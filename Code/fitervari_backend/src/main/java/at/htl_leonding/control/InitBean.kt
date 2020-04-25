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
    @Inject
    // var personDao: PersonDao? = null

    //TODO Figure this out

    private val LOG = Logger.getLogger(InitBean::class.java.simpleName)

    @Transactional
    fun init(@Observes event: StartupEvent?) {
        LOG.info(InitBean::class.java.canonicalName + "******************")

       // var persist: Any = personDao.persist(chris)
    }
}