import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/views/do_exercise_page/do_exercise_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;

  ExerciseTile(this.exercise);

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
        trailing: Icon(Icons.delete, color: Colors.red),
        isThreeLine: true,
      ),
    );
  }
}
