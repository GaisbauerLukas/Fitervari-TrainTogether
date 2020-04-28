package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.util.*
import javax.persistence.*

@Entity
@Table(name = "Customer")
data class Customer(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        val id: Long,
        @Column(name = "joindate")
        val joinDate: Date,
        @ManyToOne
        val myTrainer: Trainer,
        @Column(name = "cash_costumer")
        val cashCostumer: Boolean,
        @Column(name = "member_till")
        val memberTill: Date,
        @Column(name = "picture_id")
        val pictureId: Long
): PanacheEntity()