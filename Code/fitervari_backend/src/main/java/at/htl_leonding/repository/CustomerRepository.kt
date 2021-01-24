package at.htl_leonding.repository

import at.htl_leonding.model.Customer
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject
import javax.persistence.EntityManager

@ApplicationScoped
class CustomerRepository: PanacheRepository<Customer>{
    @Inject
    lateinit var em: EntityManager

    fun save(customer: Customer): Customer {
        return em.merge(customer)
    }
}