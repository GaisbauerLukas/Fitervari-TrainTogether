package at.htl_leonding.model

import com.fasterxml.jackson.annotation.JsonIgnore
import io.quarkus.hibernate.orm.panache.PanacheEntity
import org.hibernate.jdbc.Work
import java.time.LocalDateTime
import javax.json.bind.annotation.JsonbTransient
import javax.persistence.*

@Entity
@Table(name = "workout_history")
class WorkoutHistory(
        var date: LocalDateTime,
        @ManyToOne
        var customer: Customer,
        @ManyToOne
        @JoinColumn(name = "workout_id")
        @JsonbTransient
        var workout: Workout,
        @OneToMany
        @JoinColumn(name = "workout_history_id")
        var exerciseHistories: MutableList<ExerciseHistory> = mutableListOf()
) : PanacheEntity() {
    fun copyValues(other: WorkoutHistory) {
        this.date = other.date
        this.workout = other.workout
        this.customer = other.customer
        this.exerciseHistories = other.exerciseHistories
    }
}
