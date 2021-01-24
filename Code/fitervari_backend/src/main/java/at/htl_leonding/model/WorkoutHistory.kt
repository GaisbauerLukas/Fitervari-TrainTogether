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

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    var date: LocalDateTime,
    @ManyToOne(cascade = arrayOf(CascadeType.MERGE))
    var customer: Customer,
    @ManyToOne(cascade = arrayOf(CascadeType.MERGE))
    @JoinColumn(name = "workout_id")
    @JsonbTransient
    var workout: Workout,
    @OneToMany(cascade = arrayOf(CascadeType.ALL))
    @JoinColumn(name = "workout_history_id")
    var exerciseHistories: MutableList<ExerciseHistory> = mutableListOf()
) {
    fun copyValues(other: WorkoutHistory) {
        this.date = other.date
        this.workout = other.workout
        this.customer = other.customer
        this.exerciseHistories = other.exerciseHistories
    }
}
