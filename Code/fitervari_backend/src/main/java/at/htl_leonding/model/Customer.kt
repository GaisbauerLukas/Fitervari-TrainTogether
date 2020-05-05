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
        var myTrainer: Trainer,
        var cashCostumer: Boolean,
        var memberTill: Date,
        var pictureId: Long
): Person(){
        fun copyValues(other: Customer){
                this.joinDate = other.joinDate
                this.myTrainer = other.myTrainer
                this.cashCostumer = other.cashCostumer
                this.memberTill = other.memberTill
                this.pictureId = other.pictureId
        }
}