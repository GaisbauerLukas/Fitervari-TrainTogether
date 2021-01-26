package at.htl.control;

import at.htl.model.Exercise;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ExerciseRepository implements PanacheRepository<Exercise> {
    public Exercise save(Exercise entity) {
        return getEntityManager().merge(entity);
    }
}
