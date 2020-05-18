package at.htl_leonding.boundary

import at.htl_leonding.service.WorkoutHistoryService
import javax.inject.Inject
import javax.ws.rs.*
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class WorkoutHistoryResource {

    @Inject
    lateinit var service: WorkoutHistoryService

    @GET
    @Path("/workoutHistory/{id}")
    fun getExerciseById(@PathParam("id")id: Long): Response {
        return Response.ok(service.getById(id)).build()
    }
}