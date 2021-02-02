package at.htl.control;

import at.htl.model.WorkoutHistory;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class WorkoutHistoryRepository implements PanacheRepository<WorkoutHistory> {

    public WorkoutHistory save(WorkoutHistory entity) {
        return getEntityManager().merge(entity);
    }

    public List<WorkoutHistory> getWorkoutHistoriesByWorkoutId(Long workoutId) {
       return streamAll()
               .filter(workoutHistory -> workoutHistory.getWorkout().getId() == workoutId)
               .collect(Collectors.toList());
    }
}
