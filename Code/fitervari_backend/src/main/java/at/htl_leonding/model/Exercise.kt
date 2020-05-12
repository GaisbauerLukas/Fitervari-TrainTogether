package at.htl_leonding.model

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
        var creator: Person,
        @OneToMany(mappedBy = "exercise")
        var set: Set<ExerciseSet>,
        @OneToMany(mappedBy = "exercise")
        var workout2exercise: Set<Workout2Exercise>
) : PanacheEntity()