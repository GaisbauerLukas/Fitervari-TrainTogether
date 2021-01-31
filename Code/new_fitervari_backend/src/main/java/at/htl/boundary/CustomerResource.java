package at.htl.boundary;


import at.htl.control.CustomerRepository;
import at.htl.model.Customer;
import io.quarkus.security.Authenticated;

import javax.annotation.security.RolesAllowed;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Authenticated
@Path("/api/customer")
public class CustomerResource {

    @Inject
    CustomerRepository repository;

    @GET
    @Path("/{id}")
    @RolesAllowed("user")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(@PathParam("id") Long id) {
        return Response.ok(repository.findById(id)).build();
    }

    @GET
    @RolesAllowed("user")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll() {
        return Response.ok(repository.findAll().list()).build();
    }

    @POST
    @Transactional
    @RolesAllowed("user")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response post(Customer entity) {
        try{
            return Response.ok(repository.save(entity)).build();
        }catch (Exception e){
            return Response.serverError().build();
        }
    }

    @PUT
    @Transactional
    @RolesAllowed("user")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response put(Customer entity) {
        try{
            return Response.ok(repository.save(entity)).build();
        }catch (Exception e){
            return Response.serverError().build();
        }
    }

    @DELETE
    @Transactional
    @Path("/{id}")
    @RolesAllowed("user")
    public Response delete(@PathParam("id") Long id) {
        try{
            repository.delete(repository.findById(id));
            return Response.ok().build();
        }catch (Exception e){
            return Response.serverError().build();
        }
    }
}
