package at.htl_leonding.repository

import at.htl_leonding.model.SetHistory
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class SetHistoryRepository : PanacheRepository<SetHistory> {
    @Inject
    lateinit var em: EntityManager

    fun save(setHistory: SetHistory): SetHistory {
        return em.merge(setHistory)
    }
}