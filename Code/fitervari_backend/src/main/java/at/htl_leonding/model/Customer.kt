package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.util.*
import javax.persistence.*

@Entity
@Table(name = "customer")
data class Customer(
        var joinDate: Date,
        @ManyToOne
        @JoinColumn(name = "trainer_id")
        val myTrainer: Trainer,
        val cashCostumer: Boolean,
        val memberTill: Date,
        val pictureId: Long
): Person()