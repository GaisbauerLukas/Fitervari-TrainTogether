package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDate
import java.time.LocalDateTime
import javax.persistence.*

@Entity
@Table(name = "trainer")
data class Trainer(
        @Column(name = "trainer_since")
        var trainerSince: LocalDate,
        @Column(name = "picture_id")
        var pictureId: Int
) : PanacheEntity(){
        fun copyValues(other: Trainer){
                this.pictureId = other.pictureId
                this.trainerSince = other.trainerSince
        }
}