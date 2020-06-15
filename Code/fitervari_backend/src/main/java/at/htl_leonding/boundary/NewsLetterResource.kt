package at.htl_leonding.boundary

import at.htl_leonding.service.NewsLetterService
import javax.inject.Inject
import javax.ws.rs.*
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class NewsLetterResource {

    @Inject
    lateinit var service: NewsLetterService

    @GET
    @Path("/newsletter/{id}")
    fun getTrainerWithId(@PathParam("id") id: Long): Response {
        return Response.ok(service.getById(id)).build()
    }

    @GET
    @Path("/newsletter")
    fun getAllNewsLetters(): Response{
        return Response.ok(service.getAllNewsLetters()).build();
    }

}