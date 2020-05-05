package at.htl_leonding.boundary

import at.htl_leonding.model.Person
import at.htl_leonding.model.Trainer
import at.htl_leonding.model.Workout
import at.htl_leonding.repository.WorkoutRepository
import at.htl_leonding.service.TrainerService
import at.htl_leonding.service.WorkoutService
import io.vertx.ext.web.codec.BodyCodec
import java.time.LocalDate
import java.time.LocalDateTime
import javax.inject.Inject
import javax.json.JsonObject
import javax.transaction.Transactional
import javax.ws.rs.*
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class WorkoutResource {
    @Inject
    lateinit var service: WorkoutService

    @GET
    @Path("/workout/{id}")
    fun getWorkoutById(@PathParam("id") id: Long): Response {
        return Response.ok(service.getById(id)).build()
    }

    @POST
    @Path("/workout")
    @Transactional
    fun postWorkout(jsonObject: JsonObject): Response {
        try {
            val newWorkout = Workout(jsonObject.getString("name"),
                    LocalDateTime.parse(jsonObject.getString("creation_Date")),
                    service.getPersonById(jsonObject["creator"]?.asJsonObject()?.getInt("id")?.toLong()),
                    jsonObject.getBoolean("official_Flag"))
            newWorkout.persist()
            return Response.accepted().build()
        }catch (e: Exception){
            return Response.ok(e.message).build()
        }
    }

    @PUT
    @Path("/workout/{id}")
    @Transactional
    fun updateWorkout(@PathParam("id") id: Long, jsonObject: JsonObject): Response {
        try {
            val newWorkout = Workout(jsonObject.getString("name"),
                    LocalDateTime.parse(jsonObject.getString("creation_Date")),
                    service.getPersonById(jsonObject["creator"]?.asJsonObject()?.getInt("id")?.toLong()),
                    jsonObject.getBoolean("official_Flag"))
            service.updateWorkout(newWorkout, id)
            return Response.accepted().build()
        }catch (e: Exception){
            return Response.serverError().build()
        }
    }

    @DELETE
    @Path("/workout/{id}")
    @Transactional
    fun deleteTrainer(@PathParam("id") id: Long): Response {
        try {
            service.deleteWorkout(id)
            return Response.ok().build()
        }catch (e: Exception){
            return Response.serverError().build()
        }
    }
}