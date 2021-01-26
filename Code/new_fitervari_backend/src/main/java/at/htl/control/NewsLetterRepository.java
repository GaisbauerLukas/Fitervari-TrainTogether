package at.htl.control;

import at.htl.model.NewsLetter;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class NewsLetterRepository implements PanacheRepository<NewsLetter> {

    public NewsLetter save(NewsLetter entity) {
        return getEntityManager().merge(entity);
    }
}
