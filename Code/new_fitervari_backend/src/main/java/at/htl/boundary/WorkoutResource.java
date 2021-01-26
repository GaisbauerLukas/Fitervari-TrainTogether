package at.htl.boundary;

import at.htl.control.CustomerRepository;
import at.htl.control.TrainerRepository;
import at.htl.control.WorkoutRepository;
import at.htl.model.Workout;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/api/workout")
public class WorkoutResource {
    @Inject
    WorkoutRepository repository;

    @Inject
    TrainerRepository trainerRepository;

    @Inject
    CustomerRepository customerRepository;

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(@PathParam("id") Long id) {
        return Response.ok(repository.findById(id)).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll() {
        return Response.ok(repository.findAll().list()).build();
    }

    @POST
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response post(Workout entity) {
        try {
            if (entity.getCreator().isTrainer()) {
                entity.setCreator(trainerRepository.findById(entity.getCreator().getId()));
            } else {
                entity.setCreator(customerRepository.findById(entity.getCreator().getId()));
            }
            return Response.ok(repository.save(entity)).build();
        } catch (Exception e) {
            return Response.serverError().build();
        }
    }

    @PUT
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response put(Workout entity) {
        try {
            if (entity.getCreator().isTrainer()) {
                entity.setCreator(trainerRepository.findById(entity.getCreator().getId()));
            } else {
                entity.setCreator(customerRepository.findById(entity.getCreator().getId()));
            }
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
