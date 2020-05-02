package at.htl_leonding.model

import javax.persistence.*;


@Entity
@Table(name = "Person")
open class Person(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        val id: Long = 0,
        //@Column(name = "name")
        val name: String = "",
        //@Column(name = "is_trainer")
        val isTrainer: Boolean = false
       // @OneToOne
       // val trainer: Trainer,
       // @OneToOne
       // val customer: Customer
)