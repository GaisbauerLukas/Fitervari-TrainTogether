package at.htl.model;


import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "Person")
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "keycloak_name")
    private String keycloakName;

    @Column(name = "join_date")
    private LocalDate joinDate;

    @Column(name = "member_till")
    private LocalDate memberTill;

    @Column(name = "is_trainer")
    private boolean isTrainer;

    @Column(name = "cash_customer")
    private boolean CashCustomer;

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

    public LocalDate getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDate joinDate) {
        this.joinDate = joinDate;
    }

    public LocalDate getMemberTill() {
        return memberTill;
    }

    public void setMemberTill(LocalDate memberTill) {
        this.memberTill = memberTill;
    }

    public boolean isTrainer() {
        return isTrainer;
    }

    public void setTrainer(boolean trainer) {
        isTrainer = trainer;
    }

    public boolean isCashCustomer() {
        return CashCustomer;
    }

    public void setCashCustomer(boolean cashCustomer) {
        CashCustomer = cashCustomer;
    }

    public String getKeycloakName() {
        return keycloakName;
    }

    public void setKeycloakName(String keycloakName) {
        this.keycloakName = keycloakName;
    }

    //endregion
}
