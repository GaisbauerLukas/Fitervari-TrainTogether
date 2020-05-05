package at.htl_leonding.service

import at.htl_leonding.model.Customer
import at.htl_leonding.model.Trainer
import at.htl_leonding.repository.CustomerRepository
import at.htl_leonding.repository.TrainerRepository
import javax.enterprise.context.ApplicationScoped
import javax.inject.Inject

@ApplicationScoped
class CustomerService {

    @Inject
    private lateinit var repository: CustomerRepository

    fun test(): String {
        return "trainerservice test"
    }

    fun getById(id: Long): Customer {
        return repository.findById(id)
    }

    fun updateTrainer(customer: Customer, id: Long){
        val forUpdate = repository.findById(id)
        forUpdate.copyValues(customer)
    }

    fun deleteCustomer(id: Long){
        val forDeletion = repository.findById(id)
        repository.delete(forDeletion)
    }
}