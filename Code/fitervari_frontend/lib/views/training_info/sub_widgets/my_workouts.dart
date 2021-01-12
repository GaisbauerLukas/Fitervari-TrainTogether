import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';

class MyWorkouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
      List<Workout> workouts = workoutProvider.loadedWorkouts;


      return Container(
          margin: EdgeInsets.only(top: 10),
          height: (MediaQuery.of(context).size.height) * 0.40,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        // leading: Icon(Icons.directions_run),
                        title: Text(workouts[index].name),
                        //subtitle: Text(workouts[index].creator.name),
                      ),

                    ],
                  ),
                ),
              );
            },
            itemCount: workouts.length,
          ));
    });
  }
}
