package at.htl.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class Exercise {
    @Id
    @GeneratedValue
    private Long id;

    private String name;

    @Column(name = "creation_date")
    private LocalDateTime creationDate;

    @Column(name = "exercise_type")
    private String exerciseType;

    @Column(name = "standard_set_nr")
    private int standardSet;

    @Column(name = "official_flag")
    private boolean officialFlag;

    @ManyToOne(fetch = FetchType.EAGER)
    private Person creator;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "exercise_id")
    private List<Set> sets;

    //region GetterSetter
    public long getId() {
        return id;
    }

    public void setId(long id) {
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

    public String getExerciseType() {
        return exerciseType;
    }

    public void setExerciseType(String exerciseType) {
        this.exerciseType = exerciseType;
    }

    public int getStandardSet() {
        return standardSet;
    }

    public void setStandardSet(int standardSet) {
        this.standardSet = standardSet;
    }

    public boolean isOfficialFlag() {
        return officialFlag;
    }

    public void setOfficialFlag(boolean officialFlag) {
        this.officialFlag = officialFlag;
    }

    public Person getCreator() {
        return creator;
    }

    public void setCreator(Person creator) {
        this.creator = creator;
    }

    public List<Set> getSets() {
        return sets;
    }

    public void setSets(List<Set> sets) {
        this.sets = sets;
    }
    //endregion
}
