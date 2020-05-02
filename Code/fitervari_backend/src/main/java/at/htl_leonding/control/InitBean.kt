package at.htl_leonding.control

import at.htl_leonding.model.Trainer
import at.htl_leonding.repository.TrainerRepository
import io.quarkus.hibernate.orm.panache.PanacheEntityBase
import io.quarkus.runtime.StartupEvent
import java.time.LocalDate
import java.time.LocalDateTime
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
        print(message = "====================================================================")

        val allTrainer = trainerRepository.listAll()
        for (trainer in  allTrainer){
            println(trainer.trainerSince)
        }
        val test = Trainer(LocalDate.now(), 2)
        test.persist()

    }
}