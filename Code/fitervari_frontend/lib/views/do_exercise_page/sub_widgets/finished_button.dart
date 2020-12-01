import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/views/do_exercise_page/do_exercise_page.dart';
import 'package:fitervari/views/workout_routine/workout_routine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishedButton extends StatelessWidget {
  Exercise currentExercise;
  int currentSetNr;
  void Function() finishSet;

  FinishedButton(this.currentExercise, this.currentSetNr, this.finishSet);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => finishSet(),
      child: Card(
        margin: EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          margin: EdgeInsets.all(20),
          height: (MediaQuery.of(context).size.height -
                  SessionInfo().actionBarHeight) *
              0.095,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Erledigt',
                style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.height -
                            SessionInfo().actionBarHeight) *
                        0.08,
                    color: Colors.white,
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
