package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDateTime
import javax.persistence.*


@Entity
data class Workout (
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        val id: Int,
        val name: String,
        val creationDate: LocalDateTime,
        @ManyToOne
        val creator_id: Person,
        val official: Boolean
) : PanacheEntity()