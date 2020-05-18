package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.ManyToOne
import javax.persistence.OneToMany
import kotlin.collections.Set

data class ExerciseHistory(
        @ManyToOne
        var workoutHistory: WorkoutHistory,
        @OneToMany(mappedBy = "exerciseHistory")
        var setHistory: Set<SetHistory>
) : PanacheEntity()