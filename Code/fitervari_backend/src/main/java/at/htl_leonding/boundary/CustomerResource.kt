package at.htl_leonding.boundary

import at.htl_leonding.model.Customer
import at.htl_leonding.repository.CustomerRepository
import java.text.SimpleDateFormat
import javax.inject.Inject
import javax.json.JsonObject
import javax.transaction.Transactional
import javax.ws.rs.*
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/api/customer/")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class CustomerResource {
    @Inject
    lateinit var repository: CustomerRepository

    @GET
    @Path("{id}")
    fun getCustomerById(@PathParam("id") id: Long): Response {
        return Response.ok(repository.findById(id)).build()
    }

    @POST
    @Transactional
    fun postCustomer(customer: Customer): Response {
        try {
            return Response.accepted(repository.save(customer)).build()
        } catch (e: Exception) {
            print("============================")
            print(e.message)
            return Response.ok(e.message).build()
        }
    }


    @PUT
    @Transactional
    fun updateWorkout(customer: Customer): Response {
        try {
            return Response.accepted(repository.save(customer)).build()
        } catch (e: Exception) {
            return Response.ok(e.message).build()
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