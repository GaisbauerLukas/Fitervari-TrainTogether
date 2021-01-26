package at.htl.model;


import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "customer")
public class Customer extends Person {
    @Column(name = "join_date")
    private LocalDate joinDate;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "trainer_id")
    private Trainer myTrainer;

    @Column(name = "cash_customer")
    private boolean CashCustomer;

    @Column(name = "member_till")
    private LocalDate memberTill;

    //region GetterSetter
    public LocalDate getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDate joinDate) {
        this.joinDate = joinDate;
    }

    public Trainer getMyTrainer() {
        return myTrainer;
    }

    public void setMyTrainer(Trainer myTrainer) {
        this.myTrainer = myTrainer;
    }

    public boolean isCashCustomer() {
        return CashCustomer;
    }

    public void setCashCustomer(boolean cashCustomer) {
        CashCustomer = cashCustomer;
    }

    public LocalDate getMemberTill() {
        return memberTill;
    }

    public void setMemberTill(LocalDate memberTill) {
        this.memberTill = memberTill;
    }
    //endregion
}
