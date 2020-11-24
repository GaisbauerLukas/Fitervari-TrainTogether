import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
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
  WorkoutHistory newWorkoutHistory;

  @override
  void initState() {
    newWorkoutHistory = WorkoutHistory(
        id: 0,
        date: DateTime.now(),
        exerciseHistories: new List<ExerciseHistory>());
    Provider.of<WorkoutProvider>(context, listen: false)
        .addWorkoutHistoryToCurrentWorkout(newWorkoutHistory);
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, provider, child) {
        var currentWorkout = provider.currentWorkout;
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ExerciseTile(
                  currentWorkout.exercises[index], newWorkoutHistory);
            },
            itemCount: currentWorkout.exercises.length,
          ),
        );
      },
    );
  }
}
