package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDateTime
import javax.persistence.*


@Entity
@Table(name = "Workout")
data class Workout (
        val name: String,
        val creationDate: LocalDateTime,
        @ManyToOne
        val creator: Person,
        val official: Boolean
) : PanacheEntity()