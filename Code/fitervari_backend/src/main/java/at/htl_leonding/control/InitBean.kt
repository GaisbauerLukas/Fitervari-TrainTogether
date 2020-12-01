package at.htl_leonding.control

import at.htl_leonding.repository.TrainerRepository
import com.fasterxml.jackson.module.kotlin.KotlinModule
import io.quarkus.runtime.StartupEvent
import io.vertx.core.json.Json
import javax.enterprise.context.ApplicationScoped
import javax.enterprise.event.Observes
import javax.inject.Inject
import javax.transaction.Transactional


@ApplicationScoped
class InitBean {

    @Inject
    lateinit var trainerRepository: TrainerRepository

    //TODO Figure this out

    @Transactional
    fun init(@Observes event: StartupEvent?) {
        Json.mapper.registerModule(KotlinModule())
        Json.prettyMapper.registerModule(KotlinModule())
    }
}