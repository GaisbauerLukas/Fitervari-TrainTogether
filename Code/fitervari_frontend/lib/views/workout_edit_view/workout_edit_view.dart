import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutEditView extends StatelessWidget {
  static const routeName = '/WorkoutEditView';

  @override
  Widget build(BuildContext context) {
    final Workout workout = ModalRoute.of(context).settings.arguments;
    print(workout.name);
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
