package at.htl.model;

import javax.json.bind.annotation.JsonbTransient;
import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "workout_history")
public class WorkoutHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime date;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private Person person;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "workout_id")
    @JsonbTransient
    private Workout workout;


    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "workout_history_id")
    private List<ExerciseHistory> exerciseHistories;

    //region GetterSetter
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Workout getWorkout() {
        return workout;
    }

    public void setWorkout(Workout workout) {
        this.workout = workout;
    }

    public List<ExerciseHistory> getExerciseHistories() {
        return exerciseHistories;
    }

    public void setExerciseHistories(List<ExerciseHistory> exerciseHistories) {
        this.exerciseHistories = exerciseHistories;
    }
    //endregion
}
