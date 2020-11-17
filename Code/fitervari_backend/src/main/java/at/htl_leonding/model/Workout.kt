package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDateTime
import javax.persistence.*


@Entity
@Table(name = "Workout")
class Workout(
        var name: String,
        var creation_Date: LocalDateTime,
        @ManyToOne
        var creator: Person,
        var official_Flag: Boolean,
        @ManyToMany
        @JoinTable(
                name = "workout2exercise",
                joinColumns = [JoinColumn(name = "workout_id")],
                inverseJoinColumns = [JoinColumn(name = "exercise_id")]
        )
        var exercises: MutableList<Exercise> = mutableListOf(),
        @OneToMany
        @JoinColumn(name = "workout_id")
        var workouthistories: MutableList<WorkoutHistory> = mutableListOf()
) : PanacheEntity() {
    fun copyValues(other: Workout) {
        this.name = other.name
        this.creation_Date = other.creation_Date
        this.creator = other.creator
        this.official_Flag = other.official_Flag
    }
}