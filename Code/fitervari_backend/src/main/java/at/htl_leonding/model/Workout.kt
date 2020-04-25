package at.htl_leonding.model

import java.time.LocalDateTime
import javax.persistence.*

data class Workout (
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        val id: Int,
        val name: String,
        val creationDate: LocalDateTime,
        @ManyToOne
        val creator_id: Person,
        val official: Boolean
)