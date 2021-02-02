package at.htl.boundary;

import at.htl.control.CustomerRepository;
import at.htl.control.TrainerRepository;
import at.htl.control.WorkoutHistoryRepository;
import at.htl.control.WorkoutRepository;
import at.htl.model.Workout;
import org.hibernate.annotations.common.util.impl.Log;
import org.jboss.logging.Logger;

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

    @Inject
    WorkoutHistoryRepository workoutHistoryRepository;

    private static final Logger LOG = Logger.getLogger(WorkoutResource.class);

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

            // set entities for creator of project
            if (entity.getCreator() != null && entity.getCreator().isTrainer()) {
                entity.setCreator(trainerRepository.findById(entity.getCreator().getId()));
            } else {
                entity.setCreator(customerRepository.findById(entity.getCreator().getId()));
            }

            // set creators for all exercises
            for (var exercise :
                    entity.getExercises()) {
                if (exercise.getCreator() != null && exercise.getCreator().isTrainer()) {
                    exercise.setCreator(trainerRepository.findById(exercise.getCreator().getId()));
                } else {
                    exercise.setCreator(customerRepository.findById(exercise.getCreator().getId()));
                }
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
            // set entities for creator of project
            if (entity.getCreator() != null && entity.getCreator().isTrainer()) {
                entity.setCreator(trainerRepository.findById(entity.getCreator().getId()));
            } else {
                entity.setCreator(customerRepository.findById(entity.getCreator().getId()));
            }

            // set creators for all exercises
            for (var exercise :
                    entity.getExercises()) {
                // because the person entity has two sub-classes it is necessary to fetch from the server,
                // which of the sub-class is the creator for that workout
                if (exercise.getCreator() != null && exercise.getCreator().isTrainer()) {
                    exercise.setCreator(trainerRepository.findById(exercise.getCreator().getId()));
                } else {
                    exercise.setCreator(customerRepository.findById(exercise.getCreator().getId()));
                }
            }

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
    public Response delete(@PathParam("id") Long id) {
        try {
            repository.delete(repository.findById(id));
            return Response.ok().build();
        } catch (Exception e) {
            return Response.serverError().build();
        }
    }
}
