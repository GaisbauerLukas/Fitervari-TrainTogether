import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:fitervari/views/workout_routine/workout_routine.dart';
import 'package:flutter/material.dart';

class StartWorkoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(WorkoutRoutine.routeName),
      child: Card(
        margin: EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          margin: EdgeInsets.all(20),
          height: (MediaQuery.of(context).size.height -
                  SessionInfo().actionBarHeight) *
              0.15,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Start',
                style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.height -
                            SessionInfo().actionBarHeight) *
                        0.09,
                    color: Colors.white,
                    fontWeight: FontWeight.w100),
              ),
              Container(
                margin: EdgeInsets.all(5),
                color: Colors.white,
                width: double.infinity,
                height: 1,
              ),
              Text(
                'TestWorkout',
                style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.height -
                          SessionInfo().actionBarHeight) *
                      0.019,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
