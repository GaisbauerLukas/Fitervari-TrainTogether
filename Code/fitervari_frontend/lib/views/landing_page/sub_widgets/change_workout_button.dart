import 'package:fitervari/logic/helper/session_info.dart';
import 'package:flutter/material.dart';

import 'choose_workout_bottom_sheet.dart';

class ChangeWorkoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => ChooseWorkoutBottonSheet(),
      ),
      child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        elevation: 4,
        child: Container(
          margin: EdgeInsets.all(20),
          height: (MediaQuery.of(context).size.height -
                  SessionInfo().actionBarHeight) *
              0.053,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Anderes Workout',
                style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.height -
                            SessionInfo().actionBarHeight) *
                        0.045,
                    color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
