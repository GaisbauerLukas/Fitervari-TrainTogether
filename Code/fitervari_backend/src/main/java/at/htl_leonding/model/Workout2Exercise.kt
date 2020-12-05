package at.htl_leonding.model

import io.quarkus.hibernate.orm.panache.PanacheEntity
import javax.persistence.CascadeType
import javax.persistence.Entity
import javax.persistence.ManyToOne
import javax.persistence.Table

@Entity
@Table(name = "workout2exercise")
class Workout2Exercise(
        @ManyToOne(cascade = [CascadeType.MERGE])
        var workout: Workout,
        @ManyToOne(cascade = [CascadeType.MERGE])
        var exerciseId: Exercise
) : PanacheEntity()