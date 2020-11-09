package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.Column
import javax.persistence.Entity

@Entity
class Set(
        var repetitions: Int,
        var distance: Double,
        var weight: Double,
        var time: Double,
        @Column(name = "set_number")
        var setNumber: Double,
        var type: String
) : PanacheEntity() {
    fun copyValues(other: Set) {
        this.repetitions = other.repetitions;
        this.distance = other.distance;
        this.weight = other.weight;
        this.time = other.time;
        this.setNumber = other.setNumber;
        this.type = other.type;
    }
}