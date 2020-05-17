package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.ManyToOne

data class SetHistory (
        @ManyToOne
        var exerciseHistory: ExerciseHistory,
        var time: Double,
        var distance: Double,
        var weight: Double,
        var repetitions: Int,
        var setNumber: Int
) : PanacheEntity()