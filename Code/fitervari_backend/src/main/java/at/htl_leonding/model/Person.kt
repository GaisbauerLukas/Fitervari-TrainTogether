package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*;


@Entity
@Table(name = "person")
open class Person(
        @Column(name = "name")
        var name: String,
        @Column(name = "is_trainer")
        var isTrainer: Boolean
       // @OneToOne
       // val trainer: Trainer,
       // @OneToOne
       // val customer: Customer
) : PanacheEntity(){
        fun copyValues(other: Person){
                this.name = other.name
                this.isTrainer = other.isTrainer
        }
}