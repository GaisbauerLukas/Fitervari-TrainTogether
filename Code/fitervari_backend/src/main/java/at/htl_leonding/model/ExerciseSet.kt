package at.htl_leonding.model


import at.htl_leonding.model.Exercise
import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*

@Entity
@Table(name = "set")
data class ExerciseSet(
        @Column(name = "workout_history_id")
        var workoutHistoryId: Int,
        var repetitions: Int,
        var distance: Double,
        var weight: Double,
        var time: Double,
        @Column(name = "set_number")
        var setNumber: Int,
        var type: String,
        @ManyToOne
        var workoutHistory: WorkoutHistory,
        @ManyToOne
        @JoinColumn(name = "exercise_id")
        var exercise: Exercise
) : PanacheEntity()
