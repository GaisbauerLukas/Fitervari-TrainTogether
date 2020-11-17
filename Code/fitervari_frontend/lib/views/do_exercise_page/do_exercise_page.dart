import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/ExerciseChart.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/finished_button.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/quit_button.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class DoExercisePage extends StatefulWidget {
  static const routeName = '/doExercise';

  Exercise currentExercise;

  @override
  State<StatefulWidget> createState() => DoExercisePageState();
}

class DoExercisePageState extends State<DoExercisePage> {
  double currentWeight;
  int currentRep;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentWeight = 50;
    currentRep = 10;
  }

  @override
  Widget build(BuildContext context) {
    widget.currentExercise = ModalRoute.of(context).settings.arguments;

    return Consumer<WorkoutProvider>(
      builder: (context, workoutProvider, child){

        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: <Widget>[
                ExerciseChart(data: workoutProvider.nextWorkout.workoutHistories, currentExercise: widget.currentExercise, currentSetNumber: 0,),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Row(
                        children: <Widget>[
                          NumberPicker.decimal(
                            initialValue: currentWeight,
                            minValue: 1,
                            maxValue: 500,
                            listViewWidth: 41,
                            onChanged: (value) =>
                                setState(() => this.currentWeight = value),
                          ),
                          Text('kg', style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Row(
                        children: <Widget>[
                          NumberPicker.integer(
                            initialValue: currentRep,
                            minValue: 1,
                            maxValue: 20,
                            listViewWidth: 40,
                            onChanged: (value) => setState(() => this.currentRep = value),
                          ),
                          Text('x', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                FinishedButton(),
                QuitButton(),
              ],
            )
        );
      },
    );

  }
}
