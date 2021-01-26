package at.htl.control;

import at.htl.model.Set;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class SetRepository implements PanacheRepository<Set> {

    public Set save(Set entity) {
        return getEntityManager().merge(entity);
    }
}
