package at.htl.boundary;

import at.htl.control.ExerciseRepository;
import at.htl.control.PersonRepository;
import at.htl.model.Exercise;
import io.quarkus.security.Authenticated;
import io.quarkus.security.identity.SecurityIdentity;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.RolesAllowed;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.stream.Collectors;

@Path("/api/exercise")
@RequestScoped
public class ExerciseResource {

    @Inject
    ExerciseRepository repository;

    @Inject
    PersonRepository personRepository;

    @Inject
    SecurityIdentity identity;

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(@PathParam("id") Long id) {
        return Response.ok(repository.findById(id)).build();
    }

    @GET
    @RolesAllowed("user")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll() {
        var username = identity.getPrincipal().getName();
        return Response.ok(repository.streamAll()
                .filter(exercise -> exercise.getCreator().getKeycloakName().equals(username) ||
                        exercise.isOfficialFlag())
                .collect(Collectors.toList()))
                .build();
    }

    @POST
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response post(Exercise entity) {
        try {
            entity.setCreator(personRepository.getPersonByName(identity.getPrincipal().getName()));
            return Response.ok(repository.save(entity)).build();
        } catch (Exception e) {
            return Response.serverError().build();
        }
    }

    @PUT
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response put(Exercise entity) {
        try {
            return Response.ok(repository.save(entity)).build();
        } catch (Exception e) {
            return Response.serverError().build();
        }
    }

    @DELETE
    @Transactional
    @Path("/{id}")
    public Response delete(@PathParam("id") Long id) {
        try {
            repository.delete(repository.findById(id));
            return Response.ok().build();
        } catch (Exception e) {
            return Response.serverError().build();
        }
    }
}
