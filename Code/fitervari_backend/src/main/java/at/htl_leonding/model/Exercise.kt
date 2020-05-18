package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.util.*
import javax.persistence.*

@Entity
data class Exercise(
        var name: String,
        var creationDate: Date,
        var exerciseType: Int,
        var standardSetNr: Int,
        var officialFlag: Boolean,
        @ManyToOne
        var creator: Person,
        @OneToMany(mappedBy = "exercise")
        var set: Set<ExerciseSet>,
        @OneToMany(mappedBy = "exercise")
        var workout2exercise: Set<Workout2Exercise>
) : PanacheEntity(){
        fun copyValues(other: Exercise){
                this.name = other.name
                this.creationDate = other.creationDate
                this.exerciseType = other.exerciseType
                this.standardSetNr = other.standardSetNr
                this.officialFlag = other.officialFlag
                this.creator = other.creator
                this.set = other.set
                this.workout2exercise = other.workout2exercise
        }
}