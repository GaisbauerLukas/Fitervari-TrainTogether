
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
          MyWorkouts()
          //TODO workout-hinzufügen-button fehlt
        ],
      ),
    );
  }
}


