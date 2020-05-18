package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.util.*
import javax.persistence.*

@Entity
data class Exercise(
        var name: String,
        @Column(name="creation_date")
        var creationDate: Date,
        @Column(name = "exercise_type")
        var exerciseType: String,
         @Column(name = "standard_set_nr")
        var standardSetNr: Int,
        @Column(name = "official_flag")
        var officialFlag: Boolean,
        @ManyToOne
        var creator: Person
) : PanacheEntity(){
        fun copyValues(other: Exercise){
                this.name = other.name
                this.creationDate = other.creationDate
                this.exerciseType = other.exerciseType
                this.standardSetNr = other.standardSetNr
                this.officialFlag = other.officialFlag
                this.creator = other.creator
        }
}