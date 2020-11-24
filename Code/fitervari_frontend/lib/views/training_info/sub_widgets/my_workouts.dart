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
      List<Workout> workouts = [];

      workouts.add(new Workout(
          id: 1,
          name: 'LatTraining',
          creationDate: new DateTime.now(),
          creator: new Person(1, 'Sam', 1),
          officialFlag: false,
          exercises: null,
          workoutHistories: null));

      return Container(
          height: (MediaQuery.of(context).size.height) * 0.27,
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
