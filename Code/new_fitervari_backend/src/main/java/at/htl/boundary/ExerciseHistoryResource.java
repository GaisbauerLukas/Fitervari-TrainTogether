package at.htl.boundary;

import at.htl.control.ExerciseHistoryRepository;
import at.htl.model.ExerciseHistory;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/api/exerciseHistory")
@RequestScoped
public class ExerciseHistoryResource {

    @Inject
    ExerciseHistoryRepository repository;

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(@PathParam("id") Long id) {
        return Response.ok(repository.findById(id)).build();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll() {
        return Response.ok(repository.findAll().list()).build();
    }

    @POST
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response post(ExerciseHistory entity) {
        try{
            return Response.ok(repository.save(entity)).build();
        }catch (Exception e){
            return Response.serverError().build();
        }
    }

    @PUT
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response put(ExerciseHistory entity) {
        try{
            return Response.ok(repository.save(entity)).build();
        }catch (Exception e){
            return Response.serverError().build();
        }
    }

    @DELETE
    @Transactional
    @Path("/{id}")
    public Response delete(@PathParam("id") Long id) {
        try{
            repository.delete(repository.findById(id));
            return Response.ok().build();
        }catch (Exception e){
            return Response.serverError().build();
        }
    }
}
