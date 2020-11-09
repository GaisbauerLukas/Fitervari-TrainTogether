import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/workout_routine/sub_widgets/exercise_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutRoutine extends StatefulWidget {
  static const routeName = '/workout_routine';

  @override
  State<StatefulWidget> createState() => WorkoutRoutineState();
}

class WorkoutRoutineState extends State<WorkoutRoutine> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, provider, child) {
        var currentWorkout = provider.nextWorkout;
        return Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ExerciseTile(currentWorkout.exercises[index]);
              },
              itemCount: currentWorkout.exercises.length,
            ));
      },
    );
  }
}
