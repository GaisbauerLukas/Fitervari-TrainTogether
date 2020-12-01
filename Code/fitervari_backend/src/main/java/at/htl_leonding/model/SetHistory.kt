package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*

@Entity
@Table(name = "set_history")
class SetHistory(
        var time: Double?,
        var distance: Double?,
        var weight: Double?,
        var repetitions: Int?,
        @Column(name = "set_number")
        var setNumber: Int
) : PanacheEntity() {
    fun copyValues(other: SetHistory) {
        this.time = other.time
        this.distance = other.distance
        this.weight = other.weight
        this.repetitions = other.repetitions
        this.setNumber = other.setNumber
    }
}