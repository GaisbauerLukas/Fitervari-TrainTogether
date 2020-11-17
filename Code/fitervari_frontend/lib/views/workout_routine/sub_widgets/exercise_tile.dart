import 'package:fitervari/contracts/transfer/exercise.dart';
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
        title: Text(exercise.name),
        subtitle: Text(exercise.exerciseType),
        trailing: Icon(Icons.panorama_fish_eye, color: Colors.red,),
        isThreeLine: true,
        onTap: () {
          Navigator.pushNamed(context, DoExercisePage.routeName, arguments: exercise);
        },
      ),
    );
  }
}
