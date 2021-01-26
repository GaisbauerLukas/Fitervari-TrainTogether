package at.htl.control;

import at.htl.model.Person;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class PersonRepository implements PanacheRepository<Person> {

    public Person save(Person entity) {
        return getEntityManager().merge(entity);
    }
}
