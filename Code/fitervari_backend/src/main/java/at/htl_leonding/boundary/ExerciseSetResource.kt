package at.htl_leonding.boundary

import javax.json.JsonObject
import javax.transaction.Transactional
import javax.ws.rs.*
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class ExerciseSetResource {

    @GET
    @Path("/exerciseSet/{id}")
    fun getExerciseById(@PathParam("id") id: Long): Response {
        return Response.ok().build()
    }

    @POST
    @Path("/exerciseSet")
    @Transactional
    fun postWorkout(jsonObject: JsonObject): Response {
        try {
            return Response.accepted().build()
        } catch (e: Exception) {
            return Response.ok(e.message).build()
        }
    }

    @PUT
    @Path("/exerciseSet/{id}")
    @Transactional
    fun updateWorkout(@PathParam("id") id: Long, jsonObject: JsonObject): Response {
        try {
            return Response.accepted().build()
        } catch (e: Exception) {
            return Response.serverError().build()
        }
    }

    @DELETE
    @Path("/exerciseSet/{id}")
    @Transactional
    fun deleteTrainer(@PathParam("id") id: Long): Response {
        try {
            return Response.ok().build()
        } catch (e: Exception) {
            return Response.serverError().build()
        }
    }
}