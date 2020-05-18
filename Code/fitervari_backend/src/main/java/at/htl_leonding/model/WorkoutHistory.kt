package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDateTime
import javax.persistence.ManyToOne

data class WorkoutHistory(
        var date: LocalDateTime,
        @ManyToOne
        var workout: Workout,
        @ManyToOne
        var customer: Customer
) : PanacheEntity(){
        fun copyValues(other: WorkoutHistory){
                this.date = other.date
                this.workout = other.workout
                this.customer = other.customer
        }
}