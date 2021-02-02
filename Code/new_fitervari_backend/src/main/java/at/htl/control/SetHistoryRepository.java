package at.htl.control;

import at.htl.model.SetHistory;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class SetHistoryRepository implements PanacheRepository<SetHistory> {

    public SetHistory save(SetHistory entity) {
        return getEntityManager().merge(entity);
    }
}
