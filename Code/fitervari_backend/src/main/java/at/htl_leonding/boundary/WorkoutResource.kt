package at.htl_leonding.boundary

import at.htl_leonding.model.*
import at.htl_leonding.repository.ExerciseHistoryRepository
import at.htl_leonding.repository.SetHistoryRepository
import at.htl_leonding.repository.WorkoutHistoryRepository
import at.htl_leonding.repository.WorkoutRepository
import at.htl_leonding.service.CustomerService
import at.htl_leonding.service.WorkoutService
import java.time.LocalDateTime
import java.util.function.Consumer
import javax.inject.Inject
import javax.json.JsonArray
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


    @Inject
    lateinit var customerService: CustomerService

    @GET
    @Path("/workout")
    fun getAll(): Response {
        val tmp = service.getAll();
        return Response.ok(tmp).build();
    }

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
                    null,
                    item.getString("name"),
                    LocalDateTime.parse(item.getString("creationDate")),
                    item.getString("exerciseType"),
                    item.getInt("standardSetNr"),
                    item.getBoolean("officialFlag"),
                    service.getPersonById(item["creator"]?.asJsonObject()?.getInt("id")?.toLong())
                )
                exercises.add(newExercise)
                // Your code here
            }

            val newWorkout = Workout(
                jsonObject.getString("name"),
                LocalDateTime.parse(jsonObject.getString("creation_Date")),
                service.getPersonById(jsonObject["creator"]?.asJsonObject()?.getInt("id")?.toLong()),
                jsonObject.getBoolean("official_Flag")
            )
            newWorkout.exercises = exercises
            newWorkout.persist()
            return Response.accepted().build()
        } catch (e: Exception) {
            return Response.ok(e.message).build()
        }
    }

    @POST
    @Transactional
    @Path("workout/addWorkoutHistory/{id}/{customerId}")
    fun addWorkoutHistoryToWorkout(
        @PathParam("id") id: Long,
        @PathParam("customerId") customerId: Long,
        input: WorkoutHistory
    ): Response {
        var oldExerciseHistories: MutableList<ExerciseHistory> = mutableListOf()
        input.exerciseHistories.forEach(Consumer {
            oldExerciseHistories.add(it)
        })
        input.exerciseHistories.clear()
        oldExerciseHistories.forEach(Consumer {
            var tmp = ExerciseHistory(mutableListOf(), it.exercise_id)
            tmp.persistAndFlush()
            it.setHistories.forEach(Consumer { t ->
                run {
                    t.exercise_history_id = tmp.id
                    t.persistAndFlush()
                }
            })
            input.exerciseHistories.add(tmp)
        })

        input.customer = customerService.getById(2)
        input.workout = service.getById(id)
        input.persist()
        return Response.accepted().build()
    }

    private fun getSetFromJsonArray(jsonObject: JsonObject): Set<Exercise> {
        val tmp = setOf<Exercise>()
        for (i in 0 until jsonObject["myExercises"]?.asJsonArray()?.size!!) {
            val item = jsonObject["myExercises"]?.asJsonArray()?.get(i)?.asJsonObject()!!

            tmp.plus(
                Exercise(
                    null, item.getString("name"),
                    LocalDateTime.parse(item.getString("creationDate")),
                    item.getString("exerciseType"),
                    item.getInt("standardSetNr"),
                    item.getBoolean("officialFlag"),
                    service.getPersonById(item["creator"]?.asJsonObject()?.getInt("id")?.toLong())
                )
            )
        }
        return tmp
    }

    @PUT
    @Path("/workout")
    @Transactional
    fun updateWorkout(jsonObject: JsonObject): Response {
        try {
            val exercises: MutableList<Exercise> = mutableListOf()
            val jsonArray: JsonArray? = jsonObject["myExercises"]?.asJsonArray()

            for (i in 0 until (jsonArray?.size ?: 0)) {
                val item = jsonArray?.get(i)!!.asJsonObject()
                val newExercise = Exercise(
                    null,
                    item.getString("name"),
                    LocalDateTime.parse(item.getString("creationDate")),
                    item.getString("exerciseType"),
                    item.getInt("standardSetNr"),
                    item.getBoolean("officialFlag"),
                    service.getPersonById(3)
                )
                exercises.add(newExercise)
                // Your code here
            }
            val newWorkout = Workout(
                jsonObject.getString("name"),
                LocalDateTime.parse(jsonObject.getString("creation_Date")),
                service.getPersonById(jsonObject["creator"]?.asJsonObject()?.getInt("id")?.toLong()),
                jsonObject.getBoolean("official_Flag")
            )
            newWorkout.exercises = exercises
            service.updateWorkout(newWorkout, jsonObject.getInt("id")?.toLong())
            return Response.accepted().build()
        } catch (e: Exception) {
            return Response.serverError().build()
        }
    }

    @DELETE
    @Path("/workout/{id}")
    @Transactional
    fun deleteWorkout(@PathParam("id") id: Long): Response {
        try {
            service.deleteWorkout(id);
            return Response.ok().build()
        } catch (e: Exception) {
            return Response.ok(e.message).build()
        }
    }
}