import 'package:fitervari/views/training_info/sub_widgets/create_workout_button.dart';
import 'package:flutter/material.dart';

import 'sub_widgets/my_workouts.dart';

class TrainingInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrainingInfoState();
}

class TrainingInfoState extends State<TrainingInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // GeneralInfo(),
          Spacer(
            flex: 10,
          ),
          Text('Deine Workouts'),
          Divider(),
          MyWorkouts(),
          CreateWorkoutButton()
        ],
      ),
    );
  }

  void updateState() {
    setState(() {});
  }
}
