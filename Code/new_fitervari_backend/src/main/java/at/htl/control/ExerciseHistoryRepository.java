package at.htl.control;

import at.htl.model.ExerciseHistory;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ExerciseHistoryRepository implements PanacheRepository<ExerciseHistory> {

    public ExerciseHistory save(ExerciseHistory entity) {
        return getEntityManager().merge(entity);
    }
}
