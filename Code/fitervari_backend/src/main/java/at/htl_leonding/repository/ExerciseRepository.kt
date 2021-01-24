package at.htl_leonding.repository

import at.htl_leonding.model.Exercise
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class ExerciseRepository : PanacheRepository<Exercise>{
    @Inject
    lateinit var em: EntityManager

    fun save(exercise: Exercise): Exercise {
        return em.merge(exercise)
    }
}