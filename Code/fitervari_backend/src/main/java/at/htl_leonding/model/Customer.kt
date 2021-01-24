package at.htl_leonding.model

import java.util.*
import javax.persistence.*

@Entity
@Table(name = "customer")
class Customer: Person() {

    @Column(name = "join_date")
    lateinit var joinDate: Date

    @ManyToOne(cascade = arrayOf(CascadeType.MERGE))
    @JoinColumn(name = "trainer_id")
    lateinit var myTrainer: Trainer

    @Column(name = "cash_customer")
    var cashCostumer: Boolean = false

    @Column(name = "member_till")
    lateinit var memberTill: Date


    fun copyValues(other: Customer) {
        this.joinDate = other.joinDate
        this.myTrainer = other.myTrainer
        this.cashCostumer = other.cashCostumer
        this.memberTill = other.memberTill
        this.pictureId = other.pictureId
    }
}