package at.htl_leonding.model

import java.time.LocalDateTime
import javax.persistence.*


@Entity
@Table(name = "Workout")
class Workout(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    var name: String,
    var creation_Date: LocalDateTime,
    @ManyToOne(cascade = [CascadeType.MERGE])
    var creator: Person,
    var official_Flag: Boolean,
    @ManyToMany(cascade = [CascadeType.MERGE])
    @JoinTable(
        name = "workout2exercise",
        joinColumns = [JoinColumn(name = "workout_id")],
        inverseJoinColumns = [JoinColumn(name = "exercise_id")]
    )
    var exercises: MutableList<Exercise> = mutableListOf(),
    @OneToMany(cascade = [CascadeType.MERGE])
    @JoinColumn(name = "workout_id")
    var workouthistories: MutableList<WorkoutHistory> = mutableListOf()
) {
    fun copyValues(other: Workout) {
        this.name = other.name
        this.creation_Date = other.creation_Date
        this.creator = other.creator
        this.official_Flag = other.official_Flag
    }
}