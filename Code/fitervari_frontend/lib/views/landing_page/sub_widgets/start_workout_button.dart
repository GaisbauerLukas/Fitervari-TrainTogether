import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/workout_routine/workout_routine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartWorkoutButton extends StatefulWidget {
  @override
  _StartWorkoutButtonState createState() => _StartWorkoutButtonState();
}

class _StartWorkoutButtonState extends State<StartWorkoutButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(WorkoutRoutine.routeName),
      child: Card(
        margin: EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
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
              Consumer<WorkoutProvider>(
                builder: (context, provider, child) {
                  return Text(
                    provider.currentWorkout != null
                        ? provider.currentWorkout.name
                        : '',
                    style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.height -
                              SessionInfo().actionBarHeight) *
                          0.019,
                      color: Colors.white,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
