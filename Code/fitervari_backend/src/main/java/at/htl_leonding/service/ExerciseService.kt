package at.htl_leonding.service

import at.htl_leonding.model.Customer
import at.htl_leonding.model.Exercise
import at.htl_leonding.model.Trainer
import at.htl_leonding.repository.ExerciseRepository
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject

@ApplicationScoped
class ExerciseService {
    @Inject
    lateinit var repository: ExerciseRepository

    fun getById(id: Long): Exercise {
        return repository.findById(id)
    }

    fun addExercise(newExercise: Exercise){
        this.repository.persist(newExercise)
    }

    fun updateExercise(exercise: Exercise, id: Long){
        val forUpdate = repository.findById(id)
        forUpdate.copyValues(exercise)
    }

    fun deleteExercise(id: Long){
        val forDeletion = repository.findById(id)
        repository.delete(forDeletion)
    }
}