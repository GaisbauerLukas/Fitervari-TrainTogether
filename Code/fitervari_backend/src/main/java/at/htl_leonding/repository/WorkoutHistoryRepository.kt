package at.htl_leonding.repository

import at.htl_leonding.model.WorkoutHistory
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class WorkoutHistoryRepository : PanacheRepository<WorkoutHistory> {
    @Inject
    lateinit var em: EntityManager

    fun save(workoutHistory: WorkoutHistory): WorkoutHistory {
        return em.merge(workoutHistory)
    }
}