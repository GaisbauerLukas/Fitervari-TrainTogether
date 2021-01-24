package at.htl_leonding.repository

import at.htl_leonding.model.NewsLetter
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class NewsLetterRepository: PanacheRepository<NewsLetter> {
    @Inject
    lateinit var em: EntityManager

    fun save(newsLetter: NewsLetter): NewsLetter {
        return em.merge(newsLetter)
    }
}