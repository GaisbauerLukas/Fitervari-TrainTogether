package at.htl_leonding.service

import at.htl_leonding.model.Trainer
import at.htl_leonding.repository.TrainerRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject

@ApplicationScoped
class TrainerService {

    @Inject
    lateinit var trainerRepository: TrainerRepository

    fun test(): String {
        return "trainerservice test"
    }

    fun getById(id: Long): Trainer {
        return trainerRepository.findById(id)
    }
}