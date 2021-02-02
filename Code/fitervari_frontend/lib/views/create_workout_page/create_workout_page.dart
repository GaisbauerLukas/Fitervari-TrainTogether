import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/views/workout_edit_view/workout_edit_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateWorkoutPage extends StatefulWidget {
  static const routeName = '/createWorkout';

  @override
  State<StatefulWidget> createState() => new CreateWorkoutPageState();
}

class CreateWorkoutPageState extends State<CreateWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Workout Erstellen"),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                    // helperText: 'Helper Text',
                    // counterText: '0 characters',
                    border: const OutlineInputBorder(),
                  )),
            ),
            Expanded(child: WorkoutEditView())
          ],
        ),
      ),
    );
  }
}
