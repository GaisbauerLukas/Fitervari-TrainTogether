package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDateTime
import javax.persistence.*


@Entity
@Table(name = "workout")
class Workout (
        var name: String,
        var creation_Date: LocalDateTime,
        @ManyToOne()
        var creator: Person,
        var official_Flag: Boolean
): PanacheEntity(){

        //it is possible, that this has to be removed later on
        fun copyValues(other: Workout){
                this.name = other.name
                this.creation_Date = other.creation_Date
                this.creator = other.creator
                this.official_Flag = other.official_Flag
        }
}