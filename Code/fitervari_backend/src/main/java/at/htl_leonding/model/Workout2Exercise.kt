package at.htl_leonding.model

import javax.persistence.*

@Entity
@Table(name = "workout2exercise")
class Workout2Exercise(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    @ManyToOne(cascade = [CascadeType.MERGE])
    var workout: Workout,
    @ManyToOne(cascade = [CascadeType.MERGE])
    var exerciseId: Exercise
)