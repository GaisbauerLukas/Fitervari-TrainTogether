package at.htl_leonding.boundary

import at.htl_leonding.model.Exercise
import at.htl_leonding.repository.ExerciseRepository
import java.time.LocalDateTime
import javax.inject.Inject
import javax.json.JsonObject
import javax.transaction.Transactional
import javax.ws.rs.*
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/api/exercise/")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class ExerciseResource {

    @Inject
    lateinit var repository: ExerciseRepository

    @GET
    @Path("/{id}")
    fun getExerciseById(@PathParam("id") id: Long): Response {
        return Response.ok(repository.findById(id)).build()
    }

    @GET
    fun getAllExercises(): Response {
        return Response.ok(repository.findAll().list<Exercise>()).build();
    }

    @POST
    @Transactional
    fun postWorkout(exercise: Exercise): Response {
        try {
            return Response.accepted(repository.save(exercise)).build()
        } catch (e: Exception) {
            return Response.ok(e.message).build()
        }
    }

    @PUT
    @Transactional
    fun updateWorkout(exercise: Exercise): Response {
        try {
            return Response.accepted(repository.save(exercise)).build()
        } catch (e: Exception) {
            return Response.serverError().build()
        }
    }

    @DELETE
    @Path("{id}")
    @Transactional
    fun deleteTrainer(@PathParam("id") id: Long): Response {
        try {
            repository.delete(repository.findById(id))
            return Response.ok().build()
        } catch (e: Exception) {
            return Response.serverError().build()
        }
    }
}