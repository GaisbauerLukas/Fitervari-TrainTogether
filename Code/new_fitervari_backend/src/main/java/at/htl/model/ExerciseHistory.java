package at.htl.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "exercise_history")
public class ExerciseHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "exercise_id")
    private int exerciseId;

    @OneToMany(
            mappedBy = "exerciseHistoryId",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType.EAGER
    )
    private List<SetHistory> setHistories;

    //region GetterSetter
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public List<SetHistory> getSetHistories() {
        return setHistories;
    }

    public void setSetHistories(List<SetHistory> setHistories) {
        this.setHistories = setHistories;
    }
    //endregion
}
