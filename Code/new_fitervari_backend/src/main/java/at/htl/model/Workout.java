package at.htl.model;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "Workout")
public class Workout {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(name = "creation_Date")
    private LocalDateTime creationDate;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private Person creator;

    @Column(name = "official_flag")
    private boolean officialFlag;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinTable(
            name = "workout2exercise",
            joinColumns = @JoinColumn(name = "workout_id"),
            inverseJoinColumns = @JoinColumn(name = "exercise_id")
    )
    private List<Exercise> exercises;

    @OneToMany(cascade = CascadeType.MERGE)
    @JoinColumn(name = "workout_id")
    private List<WorkoutHistory> workoutHistories;

    //region GetterSetter
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(LocalDateTime creationDate) {
        this.creationDate = creationDate;
    }

    public Person getCreator() {
        return creator;
    }

    public void setCreator(Person creator) {
        this.creator = creator;
    }

    public boolean isOfficialFlag() {
        return officialFlag;
    }

    public void setOfficialFlag(boolean officialFlag) {
        this.officialFlag = officialFlag;
    }

    public List<Exercise> getExercises() {
        return exercises;
    }

    public void setExercises(List<Exercise> exercises) {
        this.exercises = exercises;
    }

    public List<WorkoutHistory> getWorkoutHistories() {
        return workoutHistories;
    }

    public void setWorkoutHistories(List<WorkoutHistory> workoutHistories) {
        this.workoutHistories = workoutHistories;
    }
    //endregion
}
