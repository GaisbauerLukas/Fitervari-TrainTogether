package at.htl.boundary;

import at.htl.control.PersonRepository;
import at.htl.control.WorkoutHistoryRepository;
import at.htl.control.WorkoutRepository;
import at.htl.model.Person;
import at.htl.model.Workout;
import io.quarkus.security.Authenticated;
import io.quarkus.security.identity.SecurityIdentity;
import org.eclipse.microprofile.jwt.JsonWebToken;
import org.jboss.logging.Logger;

import javax.annotation.security.RolesAllowed;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.time.LocalDate;
import java.util.stream.Collectors;


@Path("/api/workout")
@RequestScoped
public class WorkoutResource {

    @Inject
    WorkoutRepository repository;

    @Inject
    WorkoutHistoryRepository workoutHistoryRepository;

    @Inject
    PersonRepository personRepository;

    @Inject
    SecurityIdentity identity;

    private static final Logger LOG = Logger.getLogger(WorkoutResource.class);

    @GET
    @Path("/{id}")
    @RolesAllowed("user")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(@PathParam("id") Long id) {

        var workout = repository.findById(id);

        if (workout != null && workout.getCreator().getKeycloakName().equals(identity.getPrincipal().getName())) {
            return Response.ok(workout).build();
        } else {
            return Response.serverError().entity("Not found").build();
        }
    }

    @GET
    @RolesAllowed("user")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll() {

        return Response.ok(repository.streamAll()
                .filter(workout -> workout.getCreator().getKeycloakName().equals(identity.getPrincipal().getName()))
                .collect(Collectors.toList()))
                .build();
    }

    @POST
    @Transactional
    @RolesAllowed("user")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response post(Workout entity) {
        try {
            entity.setCreator(personRepository.getPersonByName(identity.getPrincipal().getName()));
            return Response.ok(repository.save(entity)).build();
        } catch (Exception e) {
            return Response.serverError().build();
        }
    }

    @PUT
    @Transactional
    @RolesAllowed("user")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response put(Workout entity) {
        try {

            entity.setCreator(personRepository.getPersonByName(identity.getPrincipal().getName()));

            if (entity.getCreator() != null) {
                // get Histories from database, because it is not ment, that they are updated here
                entity.setWorkoutHistories(workoutHistoryRepository.getWorkoutHistoriesByWorkoutId(entity.getId()));
                return Response.ok(repository.save(entity)).build();
            } else {
                return Response.serverError().entity("Creator was null").build();
            }

        } catch (Exception e) {
            LOG.debug(e);
            return Response.serverError().entity(e).build();
        }
    }

    @DELETE
    @Transactional
    @Path("/{id}")
    @RolesAllowed("user")
    public Response delete(@PathParam("id") Long id) {
        try {
            repository.delete(repository.findById(id));
            return Response.ok().build();
        } catch (Exception e) {
            return Response.serverError().build();
        }
    }
}
