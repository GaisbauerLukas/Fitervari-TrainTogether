package at.htl_leonding.model

import java.time.LocalDateTime
import javax.persistence.*

@Entity
class Exercise(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    var name: String,
    @Column(name = "creation_date")
    var creationDate: LocalDateTime,
    @Column(name = "exercise_type")
    var exerciseType: String,
    @Column(name = "standard_set_nr")
    var standardSetNr: Int,
    @Column(name = "official_flag")
    var officialFlag: Boolean,
    @ManyToOne(cascade = [CascadeType.MERGE])
    var creator: Person,
    @OneToMany(cascade = [CascadeType.MERGE])
    @JoinColumn(name = "exercise_id")
    var sets: MutableList<Set> = mutableListOf()
) {
    fun copyValues(other: Exercise) {
        this.name = other.name
        this.creationDate = other.creationDate
        this.exerciseType = other.exerciseType
        this.standardSetNr = other.standardSetNr
        this.officialFlag = other.officialFlag
        this.creator = other.creator
        this.sets = other.sets
    }
}