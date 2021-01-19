import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/views/do_exercise_page/do_exercise_page.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExerciseTile extends StatelessWidget {
  final Exercise exercise;

  AddExerciseTile(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Card tapped.');
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
