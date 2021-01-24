package at.htl_leonding.repository

import at.htl_leonding.model.NewsLetter
import at.htl_leonding.model.Person
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class PersonRepository : PanacheRepository<Person> {
    @Inject
    lateinit var em: EntityManager

    fun save(person: Person): Person {
        return em.merge(person)
    }
}