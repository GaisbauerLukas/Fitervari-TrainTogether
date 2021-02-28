package at.htl.control;

import at.htl.model.Person;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

@ApplicationScoped
public class PersonRepository implements PanacheRepository<Person> {

    public Person save(Person entity) {
        return getEntityManager().merge(entity);
    }

    public boolean checkIfCustomerAlreadyExists(String name) {
        return streamAll().anyMatch(person -> person.getKeycloakName().equals(name));
    }

    public Person getPersonByName(String name) {
        return streamAll()
                .filter(person -> person.getKeycloakName().equals(name))
                .findFirst().get();
    }
}
