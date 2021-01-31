package at.htl.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(name = "trainer")
public class Trainer extends Person {

    @Column(name = "trainer_since")
    private LocalDate trainerSince;

    //region GetterSetter
    public LocalDate getTrainerSince() {
        return trainerSince;
    }

    public void setTrainerSince(LocalDate trainerSince) {
        this.trainerSince = trainerSince;
    }
    //endregion
}
