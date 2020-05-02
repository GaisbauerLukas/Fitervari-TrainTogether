package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*;


@Entity
@Table(name = "Person")
open class Person(
        @Column(name = "name")
        val name: String,
        @Column(name = "is_trainer")
        val isTrainer: Boolean
       // @OneToOne
       // val trainer: Trainer,
       // @OneToOne
       // val customer: Customer
) : PanacheEntity()