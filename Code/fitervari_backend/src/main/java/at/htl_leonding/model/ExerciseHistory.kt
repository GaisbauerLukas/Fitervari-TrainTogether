package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*
import kotlin.collections.Set

@Entity
@Table(name = "exercise_history")
class ExerciseHistory(
        @OneToMany
        @JoinColumn(name = "exercise_history_id")
        var setHistories: MutableList<SetHistory> = mutableListOf()
) : PanacheEntity() {
    fun copyValues(other: ExerciseHistory) {
        this.setHistories = other.setHistories
    }
}