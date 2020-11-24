import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/views/do_exercise_page/do_exercise_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final WorkoutHistory workoutHistory;

  ExerciseTile(this.exercise, this.workoutHistory);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(size: 72.0),
        title: Text(exercise.name),
        subtitle: Text(exercise.exerciseType),
        trailing: Icon(
          Icons.panorama_fish_eye,
          color: Colors.red,
        ),
        isThreeLine: true,
        onTap: () {
          // TODO implement here a check, what set are already done
          Navigator.pushNamed(context, DoExercisePage.routeName,
              arguments: [exercise, 1, workoutHistory]);
        },
      ),
    );
  }
}
