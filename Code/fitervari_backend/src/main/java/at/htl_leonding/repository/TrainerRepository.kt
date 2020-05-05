package at.htl_leonding.repository

import at.htl_leonding.model.Person
import at.htl_leonding.model.Trainer
import io.quarkus.hibernate.orm.panache.PanacheRepository
import javax.enterprise.context.ApplicationScoped


@ApplicationScoped
class TrainerRepository : PanacheRepository<Trainer> {
    // put your custom logic here as instance methods

    fun deleteStefs() {
        delete("name", "Stef")
    }
}