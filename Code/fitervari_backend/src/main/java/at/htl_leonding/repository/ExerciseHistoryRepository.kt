package at.htl_leonding.repository

import at.htl_leonding.model.Customer
import at.htl_leonding.model.ExerciseHistory
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class ExerciseHistoryRepository : PanacheRepository<ExerciseHistory> {
    @Inject
    lateinit var em: EntityManager

    fun save(exerciseHistory: ExerciseHistory): ExerciseHistory {
        return em.merge(exerciseHistory)
    }
}