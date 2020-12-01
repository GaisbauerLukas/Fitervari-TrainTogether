package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.json.bind.annotation.JsonbTransient
import javax.persistence.*
import kotlin.collections.Set

@Entity
@Table(name = "exercise_history")
class ExerciseHistory(
        @OneToMany
        @JoinColumn(name = "exercise_history_id")
        var setHistories: MutableList<SetHistory> = mutableListOf(),
        var exercise_id: Int
) : PanacheEntity() {
    fun copyValues(other: ExerciseHistory) {
        this.setHistories = other.setHistories
        this.exercise_id = exercise_id
    }
}