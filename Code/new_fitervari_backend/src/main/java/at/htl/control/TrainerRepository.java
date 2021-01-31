package at.htl.control;

import at.htl.model.Trainer;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class TrainerRepository implements PanacheRepository<Trainer> {

    public Trainer save(Trainer entity) {
        return getEntityManager().merge(entity);
    }
}
