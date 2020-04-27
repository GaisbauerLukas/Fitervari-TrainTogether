package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.time.LocalDate
import javax.persistence.*

@Entity
@Table(name = "Trainer")
data class Trainer(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        val id: Int,
        val trainerSince: LocalDate,
        val picture_id: Int
) : PanacheEntity()