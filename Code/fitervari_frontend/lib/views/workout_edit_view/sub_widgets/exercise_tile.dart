import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/do_exercise_page/do_exercise_page.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final Workout workout;

  ExerciseTile(this.exercise, this.workout);

  @override
  Widget build(BuildContext context) {
    return Card(
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
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            workout.exercises.remove(exercise);
            Provider.of<WorkoutProvider>(context, listen: false)
                .updateWorkout(workout);
          },
        ),
        isThreeLine: true,
      ),
    );
  }
}
