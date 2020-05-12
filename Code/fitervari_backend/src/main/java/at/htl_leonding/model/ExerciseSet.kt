package at.htl_leonding.model


import at.htl_leonding.model.Exercise
import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*

@Table(name = "set")
data class ExerciseSet(
        var workoutHistoryId: Int,
        var repetitions: Int,
        var distance: Double,
        var weight: Double,
        var time: Double,
        var setNumber: Int,
        var type: ExerciseType,

        // TODO Add proper relations as soon all entities are implemented
        //,
        //var refWorkoutHistoryEntity: WorkoutHistoryEntity? = null
        //
        @ManyToOne
        var exercise: Exercise
) : PanacheEntity()
