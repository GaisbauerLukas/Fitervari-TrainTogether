package at.htl_leonding.service

import at.htl_leonding.model.*
import at.htl_leonding.repository.*
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject

@ApplicationScoped
class WorkoutService {
    @Inject
    lateinit var repository: WorkoutRepository

    @Inject
    lateinit var historyRepository: WorkoutHistoryRepository

    @Inject
    lateinit var exerchiseHistoryRepository: ExerciseHistoryRepository

    @Inject
    lateinit var setHistoryRepository: SetHistoryRepository

    @Inject
    lateinit var personRepository: PersonRepository

    fun getAll():List<Workout> {
        return repository.findAll().list<Workout>();
    }

    fun getById(id: Long): Workout {
        return repository.findById(id)
    }

    fun updateWorkout(workout: Workout, id: Long) {
        val forUpdate = repository.findById(id)
        forUpdate.copyValues(workout)
    }

    fun deleteWorkout(id: Long) {
        val forDeletion = repository.findById(id) ?: throw Exception("entity not found")
        var histories = historyRepository.find("workout_id = ?1", id).list<WorkoutHistory>()

        for (item in histories) {
            var exerciseHs = exerchiseHistoryRepository.find("workout_history_id = ?1", item.id).list<ExerciseHistory>()
            for (element in exerciseHs) {
                var setHs = setHistoryRepository.find("exercise_history_id = ?1", element.id).list<SetHistory>()
                for(set in setHs) {
                    setHistoryRepository.delete(set)
                }
                exerchiseHistoryRepository.delete(element)
            }
            historyRepository.delete(item)
        }

        repository.delete(forDeletion)
    }

    fun getPersonById(id: Long?): Person {
        return personRepository.findById(id)
    }
}