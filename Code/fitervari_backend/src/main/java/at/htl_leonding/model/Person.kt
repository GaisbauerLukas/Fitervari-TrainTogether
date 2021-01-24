package at.htl_leonding.model

import javax.persistence.*

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "Person")
open class Person{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null

    @Column(name = "name")
    lateinit var name: String

    @Column(name = "is_trainer")
    var is_Trainer: Boolean = false

    @Column(name = "picture_id")
    var pictureId: Int = 0

    fun copyValues(other: Person) {
        this.name = other.name
        this.is_Trainer = other.is_Trainer
        this.pictureId = other.pictureId
    }
}