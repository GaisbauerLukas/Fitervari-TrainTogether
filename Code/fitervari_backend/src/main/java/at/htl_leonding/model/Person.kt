package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.*;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "Person")
open class Person(
        @Column(name = "name")
        var name: String,
        @Column(name = "is_trainer")
        var is_Trainer: Boolean
/*       @OneToOne
       val trainer: Trainer,
       @OneToOne
       val customer: Customer*/
) : PanacheEntity(){
        fun copyValues(other: Person) {

        }
}