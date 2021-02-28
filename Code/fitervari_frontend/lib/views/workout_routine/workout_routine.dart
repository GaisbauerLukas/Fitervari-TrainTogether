import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/providers/authentication_provider.dart';
import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/workout_routine/sub_widgets/exercise_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        id: null,
        date: DateTime.now(),
        exerciseHistories: new List<ExerciseHistory>());
    Provider.of<WorkoutProvider>(context, listen: false)
        .addWorkoutHistoryToCurrentWorkout(newWorkoutHistory);
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  void setExerciseHistoryFinished(ExerciseHistory exerciseHistory) {
    this.setState(() {
      exerciseHistory.isFinished = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<WorkoutProvider>(
      builder: (context, provider, child) {

        var currentWorkout = provider.currentWorkout;
        Widget body;

        if (newWorkoutHistory.exerciseHistories.length ==
                currentWorkout.exercises.length &&
            this._checkIfWorkoutIsFinished(
                newWorkoutHistory.exerciseHistories)) {

          body = Consumer<AuthenticationProvider>(
            builder: (context, value, child) {
              Provider.of<WorkoutProvider>(context, listen: false)
                  .postWorkoutHistoryToCurrentWorkout(
                      newWorkoutHistory, value.token);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset('lib/assets/animations/GrowthAnimation.zip'),
                    Text(
                      'Geschafft!!',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              );
            },
          );

        } else {

          if (currentWorkout != null) {

            body = ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ExerciseTile(currentWorkout.exercises[index],
                    newWorkoutHistory, this.setExerciseHistoryFinished);
              },
              itemCount: currentWorkout.exercises.length,
            );

          } else {
            body = Text("Fehler mit der Verbindung");
          }
        }

        return Scaffold(
          appBar: AppBar(),
          body: body,
        );
      },
    );
  }

  bool _checkIfWorkoutIsFinished(List<ExerciseHistory> exerciseHistories) {
    bool result = true;

    exerciseHistories.forEach((element) {
      if (!element.isFinished) result = false;
    });

    return result;
  }
}
