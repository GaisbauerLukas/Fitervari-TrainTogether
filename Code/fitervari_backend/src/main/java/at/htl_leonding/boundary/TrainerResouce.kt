package at.htl_leonding.boundary

import at.htl_leonding.model.Trainer
import at.htl_leonding.service.GreetingService
import at.htl_leonding.service.TrainerService
import javax.enterprise.inject.Default
import javax.inject.Inject
import javax.ws.rs.*
import javax.ws.rs.core.MediaType

@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class TrainerResouce {

    @Inject
    @field: Default
    lateinit var service: TrainerService

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/trainer")
    fun greeting(): String {
        return service.test()
    }

    @GET
    @Produces("application/json")
    @Path("/trainer/{id}")
    fun greeting(@PathParam("id") id: Long): Trainer {
        return service.getById(id)
    }

}