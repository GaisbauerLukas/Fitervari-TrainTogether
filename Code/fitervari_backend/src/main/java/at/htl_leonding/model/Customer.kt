package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import java.util.*
import javax.persistence.*

@Entity
@Table(name = "customer")
class Customer(
        name: String,
        var joinDate: Date,
        @ManyToOne
        @JoinColumn(name = "trainer_id")
        var myTrainer: Trainer,
        @Column(name = "cash_customer")
        var cashCostumer: Boolean,
        @Column(name = "member_till")
        var memberTill: Date,
        @Column(name = "picture_id")
        var pictureId: Long
): Person( name, false){
        fun copyValues(other: Customer){
                this.joinDate = other.joinDate
                this.myTrainer = other.myTrainer
                this.cashCostumer = other.cashCostumer
                this.memberTill = other.memberTill
                this.pictureId = other.pictureId
        }
}