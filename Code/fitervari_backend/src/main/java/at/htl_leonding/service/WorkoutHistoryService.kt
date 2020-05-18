package at.htl_leonding.service

import at.htl_leonding.model.Person
import at.htl_leonding.model.Workout
import at.htl_leonding.model.WorkoutHistory
import at.htl_leonding.repository.WorkoutHistoryRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject

@ApplicationScoped
class WorkoutHistoryService {
    @Inject
    lateinit var repository: WorkoutHistoryRepository

    fun getById(id: Long): WorkoutHistory {
        return repository.findById(id)
    }

    fun updateWorkoutHistory(workout: WorkoutHistory, id: Long){
        val forUpdate = repository.findById(id)
        forUpdate.copyValues(workout)
    }

    fun deleteWorkout(id: Long){
        val forDeletion = repository.findById(id)
        repository.delete(forDeletion)
    }
}