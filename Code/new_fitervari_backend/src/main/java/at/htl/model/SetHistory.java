package at.htl.model;

import javax.persistence.*;

@Entity
@Table(name = "set_history")
public class SetHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double time;

    private double distance;

    private double weight;

    @Column(name = "exercise_history_id")
    private long exerciseHistoryId;

    @Column(name = "set_number")
    private int setNumber;

    //region GetterSetter
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getTime() {
        return time;
    }

    public void setTime(double time) {
        this.time = time;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public long getExerciseHistoryId() {
        return exerciseHistoryId;
    }

    public void setExerciseHistoryId(long exerciseHistoryId) {
        this.exerciseHistoryId = exerciseHistoryId;
    }

    public int getSetNumber() {
        return setNumber;
    }

    public void setSetNumber(int setNumber) {
        this.setNumber = setNumber;
    }
    //endregion
}
