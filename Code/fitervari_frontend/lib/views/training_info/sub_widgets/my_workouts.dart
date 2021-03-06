import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/providers/authentication_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/workout_edit_view/workout_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWorkouts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyWorkoutsState();
}

class MyWorkoutsState extends State<MyWorkouts> {
  List<Workout> workouts;

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
      workouts = workoutProvider.loadedWorkouts;
      return Container(
          margin: EdgeInsets.only(top: 10),
          height: (MediaQuery.of(context).size.height) * 0.58,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.pushNamed(context, WorkoutEditView.routeName,
                        arguments: workouts[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          dense: true,
                          // leading: Icon(Icons.directions_run),
                          title: Text(workouts[index].name),
                          //subtitle: Text(workouts[index].creator.name),
                          trailing: Consumer<AuthenticationProvider>(
                              builder: (context, value, child) {
                            return IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () async {
                                  Provider.of<WorkoutProvider>(context,
                                          listen: false)
                                      .deleteWorkout(
                                          workouts[index], await value.token);
                                });
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: workouts.length,
          ));
    });
  }
}
