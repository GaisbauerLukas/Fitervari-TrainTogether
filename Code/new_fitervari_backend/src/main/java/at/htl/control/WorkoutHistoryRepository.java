package at.htl.control;

import at.htl.model.WorkoutHistory;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class WorkoutHistoryRepository implements PanacheRepository<WorkoutHistory> {

    public WorkoutHistory save(WorkoutHistory entity) {
        return getEntityManager().merge(entity);
    }
}
