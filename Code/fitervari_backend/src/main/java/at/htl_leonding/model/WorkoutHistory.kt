package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDate
import javax.persistence.ManyToOne
import javax.persistence.OneToMany

data class WorkoutHistory(
        var date: LocalDate,
        @ManyToOne
        var workout: Workout,
        @ManyToOne
        var customer: Customer,
        @OneToMany(mappedBy = "workoutHistory")
        var exerciseHistory: ExerciseHistory,
        @OneToMany(mappedBy = "workoutHistory")
        var exerciseSet: Set<ExerciseSet>
) : PanacheEntity()