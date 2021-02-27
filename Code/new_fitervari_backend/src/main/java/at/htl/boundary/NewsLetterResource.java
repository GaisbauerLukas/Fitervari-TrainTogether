package at.htl.boundary;

import at.htl.control.NewsLetterRepository;
import at.htl.control.PersonRepository;
import at.htl.model.NewsLetter;
import at.htl.model.Person;
import org.eclipse.microprofile.jwt.JsonWebToken;

import javax.annotation.security.RolesAllowed;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.time.LocalDate;

@Path("/api/newsletter")
public class NewsLetterResource {

    @Inject
    NewsLetterRepository repository;

    @Inject
    PersonRepository personRepository;

    @Inject
    JsonWebToken idToken;

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getById(@PathParam("id") Long id) {
        return Response.ok(repository.findById(id)).build();
    }

    @GET
    @Transactional
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll() {
        var name = idToken.getName();
        System.out.println(name);
        if (!personRepository.checkIfCustomerAlreadyExists(idToken.getName())) {
            personRepository.persistAndFlush(new Person(
                    idToken.getName(),
                    idToken.getName(),
                    LocalDate.now(),
                    null,
                    false,
                    false
            ));
        }

        return Response.ok(repository.findAll().list()).build();
    }

    @POST
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response post(NewsLetter entity) {
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
    public Response put(NewsLetter entity) {
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
