package at.htl_leonding.repository

import at.htl_leonding.model.Trainer
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class TrainerRepository : PanacheRepository<Trainer> {
    @Inject
    lateinit var em: EntityManager

    fun save(trainer: Trainer): Trainer {
        return em.merge(trainer)
    }
}