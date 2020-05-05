package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@Table(name = "Person")
open class Person(
        @Column(name = "name")
        var name: String,
        @Column(name = "is_trainer")
        var is_Trainer: Boolean
       // @OneToOne
       // val trainer: Trainer,
       // @OneToOne
       // val customer: Customer
) : PanacheEntity() {
        constructor() : this("", false){
        }

        fun copyValues(other: Person){
                this.name = other.name
                this.is_Trainer = other.is_Trainer
        }
}