package at.htl_leonding.model


import javax.persistence.*

@Entity
@Table(name = "set")
class ExerciseSet(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    var repeditions: Int?,
    var distance: Double?,
    var weight: Double?,
    var time: Double?,
    @Column(name = "set_number")
    var setNumber: Int,
    var type: String,
    @ManyToOne(cascade = [CascadeType.MERGE])
    @JoinColumn(name = "exercise_id")
    var exercise: Exercise
) {
    fun copyValues(other: ExerciseSet) {
        this.repeditions = other.repeditions
        this.distance = other.distance
        this.weight = other.weight
        this.time = other.time
        this.setNumber = other.setNumber
        this.type = other.type
        this.exercise = other.exercise
    }
}
