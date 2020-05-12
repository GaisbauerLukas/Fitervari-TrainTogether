package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.ManyToOne

data class Workout2Exercise (
    @ManyToOne
    var workout: Workout,
    @ManyToOne
    var exerciseId: Exercise
) : PanacheEntity()