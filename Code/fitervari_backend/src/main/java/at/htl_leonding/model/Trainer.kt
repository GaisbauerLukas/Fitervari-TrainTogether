package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDate
import javax.persistence.*

@Entity
@Table(name = "Trainer")
data class Trainer(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        val id: Long,
        @Column(name = "trainer_since")
        val trainerSince: LocalDate,
        @Column(name = "picture_id")
        val pictureId: Int
) : PanacheEntity()