package at.htl_leonding.model

import java.time.LocalDate
import javax.persistence.*

@Entity
@Table(name = "trainer")
class Trainer : Person() {

    @Column(name = "trainer_since")
    lateinit var trainerSince: LocalDate

    fun copyValues(other: Trainer) {
        this.pictureId = other.pictureId
        this.trainerSince = other.trainerSince
    }
}