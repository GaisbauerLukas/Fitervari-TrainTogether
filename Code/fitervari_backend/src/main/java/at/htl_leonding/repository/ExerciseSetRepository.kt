package at.htl_leonding.repository

import at.htl_leonding.model.ExerciseSet
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class ExerciseSetRepository : PanacheRepository<ExerciseSet>{
    @Inject
    lateinit var em: EntityManager

    fun save(exerciseSet: ExerciseSet): ExerciseSet {
        return em.merge(exerciseSet)
    }
}