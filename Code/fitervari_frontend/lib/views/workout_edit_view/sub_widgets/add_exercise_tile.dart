import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final Workout workout;

  AddExerciseTile(this.exercise, this.workout);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          this.workout.exercises.add(this.exercise);
          Provider.of<WorkoutProvider>(context, listen: false)
              .updateWorkout(workout);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        child: ListTile(
          leading: FlutterLogo(size: 72.0),
          title: Text(
            exercise.name,
            style: TextStyle(fontSize: 25),
          ),
          subtitle: Text(
            exercise.exerciseType,
            style: TextStyle(fontSize: 15),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
