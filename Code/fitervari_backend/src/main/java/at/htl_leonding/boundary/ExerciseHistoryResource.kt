package at.htl_leonding.boundary

import at.htl_leonding.model.ExerciseHistory
import at.htl_leonding.repository.ExerciseHistoryRepository
import javax.inject.Inject
import javax.json.JsonObject
import javax.transaction.Transactional
import javax.ws.rs.*
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/api/exerciseHistory/")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class ExerciseHistoryResource {

    @Inject
    lateinit var repository: ExerciseHistoryRepository

    @GET
    @Path("{id}")
    fun getExerciseById(@PathParam("id") id: Long): Response {
        return Response.ok(repository.findById(id)).build()
    }

    @POST
    @Transactional
    fun postWorkout(exerciseHistory: ExerciseHistory): Response {
        try {
            return Response.accepted(repository.save(exerciseHistory)).build()
        } catch (e: Exception) {
            return Response.ok(e.message).build()
        }
    }

    @DELETE
    @Path("/exerciseHistory/{id}")
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