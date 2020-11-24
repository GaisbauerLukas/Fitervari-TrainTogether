package at.htl_leonding.boundary

import at.htl_leonding.model.Exercise
import at.htl_leonding.model.Workout
import at.htl_leonding.service.WorkoutService
import java.time.LocalDateTime
import javax.annotation.security.RolesAllowed
import javax.inject.Inject
import javax.json.JsonArray
import javax.json.JsonObject
import javax.transaction.Transactional
import javax.ws.rs.*
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/api")
@RolesAllowed("user")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
class WorkoutResource {
    @Inject
    lateinit var service: WorkoutService

    @GET
    @Path("/workout/{id}")
    fun getWorkoutById(@PathParam("id") id: Long): Response {
        val tmp = service.getById(id)
        return Response.ok(tmp).build()
    }

    @POST
    @Path("/workout")
    @Transactional
    fun postWorkout(jsonObject: JsonObject): Response {
        try {
            val exercises: MutableList<Exercise> = mutableListOf()
            val jsonArray: JsonArray? = jsonObject["myExercises"]?.asJsonArray()

            for (i in 0 until (jsonArray?.size ?: 0)) {
                val item = jsonArray?.get(i)!!.asJsonObject()
                val newExercise = Exercise(
                        item.getString("name"),
                        LocalDateTime.parse(item.getString("creationDate")),
                        item.getString("exerciseType"),
                        item.getInt("standardSetNr"),
                        item.getBoolean("officialFlag"),
                        service.getPersonById(item["creator"]?.asJsonObject()?.getInt("id")?.toLong())
                )
                newExercise.persistAndFlush()
                exercises.add(newExercise)
                // Your code here
            }

            val newWorkout = Workout(jsonObject.getString("name"),
                    LocalDateTime.parse(jsonObject.getString("creation_Date")),
                    service.getPersonById(jsonObject["creator"]?.asJsonObject()?.getInt("id")?.toLong()),
                    jsonObject.getBoolean("official_Flag"))
            newWorkout.exercises = exercises
            newWorkout.persist()
            return Response.accepted().build()
        } catch (e: Exception) {
            return Response.ok(e.message).build()
        }
    }

    private fun getSetFromJsonArray(jsonObject: JsonObject): Set<Exercise> {
        val tmp = setOf<Exercise>()
        for (i in 0 until jsonObject["myExercises"]?.asJsonArray()?.size!!) {
            val item = jsonObject["myExercises"]?.asJsonArray()?.get(i)?.asJsonObject()!!

            tmp.plus(Exercise(item.getString("name"),
                    LocalDateTime.parse(item.getString("creationDate")),
                    item.getString("exerciseType"),
                    item.getInt("standardSetNr"),
                    item.getBoolean("officialFlag"),
                    service.getPersonById(item["creator"]?.asJsonObject()?.getInt("id")?.toLong())))
        }
        return tmp
    }

    @PUT
    @Path("/workout/{id}")
    @Transactional
    fun updateWorkout(@PathParam("id") id: Long, jsonObject: JsonObject): Response {
        try {
            val exercises: MutableList<Exercise> = mutableListOf()
            val jsonArray: JsonArray? = jsonObject["myExercises"]?.asJsonArray()

            for (i in 0 until (jsonArray?.size ?: 0)) {
                val item = jsonArray?.get(i)!!.asJsonObject()
                val newExercise = Exercise(
                        item.getString("name"),
                        LocalDateTime.parse(item.getString("creationDate")),
                        item.getString("exerciseType"),
                        item.getInt("standardSetNr"),
                        item.getBoolean("officialFlag"),
                        service.getPersonById(item["creator"]?.asJsonObject()?.getInt("id")?.toLong())
                )
                newExercise.persistAndFlush()
                exercises.add(newExercise)
                // Your code here
            }

            val newWorkout = Workout(jsonObject.getString("name"),
                    LocalDateTime.parse(jsonObject.getString("creation_Date")),
                    service.getPersonById(jsonObject["creator"]?.asJsonObject()?.getInt("id")?.toLong()),
                    jsonObject.getBoolean("official_Flag"))
            newWorkout.exercises = exercises
            service.updateWorkout(newWorkout, id)
            return Response.accepted().build()
        } catch (e: Exception) {
            return Response.serverError().build()
        }
    }

    @DELETE
    @Path("/workout/{id}")
    @Transactional
    fun deleteTrainer(@PathParam("id") id: Long): Response {
        return try {
            service.deleteWorkout(id)
            Response.ok().build()
        } catch (e: Exception) {
            Response.serverError().build()
        }
    }
}