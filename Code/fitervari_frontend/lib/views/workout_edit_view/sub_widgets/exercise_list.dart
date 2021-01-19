import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/logic/providers/exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ExerciseProvider>(
      builder: (context, provider, child) {
        exercises = provider.exercises;
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return ExerciseTile(exercises[index]);
            },
            itemCount: exercises.length,
          ),
        );
      },
    );
  }
}
