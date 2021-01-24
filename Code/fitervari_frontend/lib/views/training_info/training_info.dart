import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/views/create_workout_page/create_workout_page.dart';
import 'package:fitervari/views/training_info/sub_widgets/create_workout_button.dart';
import 'package:flutter/material.dart';

import 'sub_widgets/general_info.dart';
import 'sub_widgets/my_workouts.dart';

class TrainingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          GeneralInfo(),
          MyWorkouts(),
          CreateWorkoutButton()
        ],
      ),
    );
  }
}
