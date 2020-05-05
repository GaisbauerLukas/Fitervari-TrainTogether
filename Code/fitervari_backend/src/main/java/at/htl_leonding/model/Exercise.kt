package generated.at.htl_leonding.model

import at.htl_leonding.model.Person
import generated.PersonEntity
import generated.SetEntity
import generated.Workout2exerciseEntity
import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.util.*
import javax.persistence.*

data class Exercise(
        var name: String,
        var creationDate: Date,
        var exerciseType: Int,
        var standardSetNr: Int,
        var officialFlag: Boolean,
        @ManyToOne
        var creator: Person

// TODO Add proper relations as soon all entities are implemented
// ,
//        @OneToMany(mappedBy = "exercise")
//        var set: Set<Set>,
//        @OneToMany(mappedBy = "exercise")
//        var workout2exercise: Set<Workout2exercise>)
) : PanacheEntity()