import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:fitervari/views/workout_edit_view/sub_widgets/exercise_list.dart';
import 'package:fitervari/views/workout_edit_view/sub_widgets/exercise_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutEditView extends StatelessWidget {
  static const routeName = '/WorkoutEditView';

  @override
  Widget build(BuildContext context) {
    final Workout workout = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(ExerciseList.routeName),
              icon: Icon(Icons.add),
              color: Colors.white,
            )
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return ExerciseTile(workout.exercises[index]);
          },
          itemCount: workout.exercises.length,
        ),
    );
  }
}
