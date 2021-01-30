import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/providers/exercise_provider.dart';
import 'package:fitervari/views/exercise_view/create_exercise.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_exercise_tile.dart';

class ExerciseList extends StatefulWidget {
  static const routeName = "/Exercise_List";

  @override
  State<StatefulWidget> createState() {
    return ExerciseRoutineState();
  }
}

class ExerciseRoutineState extends State<ExerciseList> {
  List<Exercise> exercises;
  Workout workout;

  @override
  void initState() {
    super.initState();
    Provider.of<ExerciseProvider>(context, listen: false).loadExercises();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    this.workout = ModalRoute.of(context).settings.arguments;

    return Consumer<ExerciseProvider>(
      builder: (context, provider, child) {
        exercises = provider.exercises;
        var displayList = List<Exercise>();

        exercises.forEach((exercise) {
          var isInWorkout = false;

          workout.exercises.forEach((inWorkout) {
            if (exercise.id == inWorkout.id) {
              isInWorkout = true;
            }
          });

          if (!isInWorkout) {
            displayList.add(exercise);
          }
        });

        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return AddExerciseTile(displayList[index], workout);
            },
            itemCount: displayList.length,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(CreateExercise.routeName),
          ),
        );
      },
    );
  }
}
