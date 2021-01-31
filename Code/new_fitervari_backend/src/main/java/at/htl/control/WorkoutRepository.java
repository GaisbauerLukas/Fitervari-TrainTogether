package at.htl.control;

import at.htl.model.Workout;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class WorkoutRepository implements PanacheRepository<Workout> {

    public Workout save(Workout entity) {
        return getEntityManager().merge(entity);
    }
}
