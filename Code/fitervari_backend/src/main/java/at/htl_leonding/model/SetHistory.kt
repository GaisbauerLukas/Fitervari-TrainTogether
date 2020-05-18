package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*

@Entity
@Table(name = "set_history")
data class SetHistory (
        @ManyToOne
        @JoinColumn(name = "exersice_history_id")
        var exerciseHistory: ExerciseHistory,
        var time: Double,
        var distance: Double,
        var weight: Double,
        var repetitions: Int,
        @Column(name = "set_number")
        var setNumber: Int
) : PanacheEntity()