package at.htl.boundary;

import at.htl.control.PersonRepository;
import io.quarkus.security.identity.SecurityIdentity;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/api/person")
@RequestScoped
public class PersonResource {

    @Inject
    PersonRepository personRepository;

    @Inject
    SecurityIdentity identity;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPerson(){
        return Response.ok(personRepository.getPersonByName(identity.getPrincipal().getName())).build();
    }
}
