import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/providers/exercise_provider.dart';
import 'package:fitervari/views/exercise_view/create_exercise.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_exercise_tile.dart';
import 'exercise_tile.dart';

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
        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                onPressed: () =>
                    {print("right"),Navigator.of(context).pushNamed(CreateExercise.routeName),},
                icon: Icon(Icons.add),
                color: Colors.white,
              )
            ],
          ),
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return AddExerciseTile(exercises[index], workout);
            },
            itemCount: exercises.length,
          ),
        );
      },
    );
  }
}
