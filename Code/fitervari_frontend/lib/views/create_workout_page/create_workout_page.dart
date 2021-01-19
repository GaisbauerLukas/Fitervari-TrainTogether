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
            Text(
              'Workout erstellen',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
