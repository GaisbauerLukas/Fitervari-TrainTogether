package at.htl.model;

import javax.persistence.*;

@Entity
@Table(name = "workout2exercise")
public class Workout2Exercise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    private Workout workout;

    @ManyToOne(cascade = CascadeType.MERGE)
    private Exercise exercise;
}
