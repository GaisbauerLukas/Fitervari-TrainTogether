package at.htl.control;

import at.htl.model.Customer;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class CustomerRepository implements PanacheRepository<Customer> {

    public Customer save(Customer customer) {
        return getEntityManager().merge(customer);
    }
}
