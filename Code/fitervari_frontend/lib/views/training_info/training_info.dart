import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/views/create_workout_page/create_workout_page.dart';
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
          InkWell(
            onTap: () =>
                Navigator.of(context).pushNamed(CreateWorkoutPage.routeName),
            child: Card(
              margin: EdgeInsets.all(10),
              color: Theme.of(context).primaryColor,
              elevation: 4,
              child: Container(
                margin: EdgeInsets.all(20),
                height: (MediaQuery.of(context).size.height -
                        SessionInfo().actionBarHeight) *
                    0.04,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Neues Workout erstellen',
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.height -
                                SessionInfo().actionBarHeight) *
                            0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
