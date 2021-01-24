package at.htl_leonding.repository

import at.htl_leonding.model.Workout
import at.htl_leonding.model.WorkoutHistory
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class WorkoutRepository : PanacheRepository<Workout> {
    @Inject
    lateinit var em: EntityManager

    fun save(workout: Workout): Workout {
        return em.merge(workout)
    }
}