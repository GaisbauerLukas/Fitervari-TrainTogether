package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDate
import javax.persistence.*

@Entity
@Table(name = "trainer")
class Trainer(
        name: String,
        @Column(name = "trainer_since")
        var trainerSince: LocalDate,
        @Column(name = "picture_id")
        var pictureId: Int
) : Person( name, true){
        fun copyValues(other: Trainer){
                this.pictureId = other.pictureId
                this.trainerSince = other.trainerSince
        }
}