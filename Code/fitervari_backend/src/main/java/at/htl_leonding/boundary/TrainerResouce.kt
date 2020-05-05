package at.htl_leonding.boundary

import at.htl_leonding.model.Trainer
import at.htl_leonding.service.TrainerService
import java.time.LocalDate
import javax.inject.Inject
import javax.json.JsonObject
import javax.transaction.Transactional
import javax.ws.rs.*
import javax.ws.rs.core.Context
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response
import javax.ws.rs.core.UriInfo

@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class TrainerResouce {

    @Inject
    lateinit var service: TrainerService

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/trainer")
    fun testTrainer(): String {
        return service.test()
    }

    @GET
    @Path("/trainer/{id}")
    fun getTrainerWithId(@PathParam("id") id: Long): Response {
        return Response.ok(service.getById(1)).build()
    }

    @POST
    @Path("/trainer")
    @Transactional
    fun postTrainer(jsonObject: JsonObject): Response{
        try {
            val newTrainer = Trainer(LocalDate.parse(jsonObject.asJsonObject().getString("trainerSince")),
                    jsonObject.asJsonObject().getInt("pictureId"))
            newTrainer.persist()
            return Response.accepted().build()
        }catch (e: Exception){
            return Response.serverError().build()
        }
    }

    @PUT
    @Path("/trainer/{id}")
    @Transactional
    fun updateTrainer(@PathParam("id") id: Long, jsonObject: JsonObject): Response{
        try {
            val newTrainer = Trainer(LocalDate.parse(jsonObject.getString("trainerSince")),
                    jsonObject.getInt("pictureId"))
            service.updateTrainer(newTrainer, id)
            return Response.accepted().build()
        }catch (e: Exception){
            return Response.serverError().build()
        }
    }

    @DELETE
    @Path("/trainer/{id}")
    @Transactional
    fun deleteTrainer(@PathParam("id") id: Long): Response{
        try {
            service.deleteTrainer(id)
            return Response.ok().build()
        }catch (e: Exception){
            return Response.serverError().build()
        }
    }
}