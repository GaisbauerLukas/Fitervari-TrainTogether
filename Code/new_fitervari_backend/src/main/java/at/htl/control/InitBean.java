package at.htl.control;

import io.quarkus.runtime.StartupEvent;
import io.vertx.core.json.Json;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.event.Observes;
import javax.transaction.Transactional;

@ApplicationScoped
public class InitBean {

    void init(@Observes StartupEvent event) {
    }
}
