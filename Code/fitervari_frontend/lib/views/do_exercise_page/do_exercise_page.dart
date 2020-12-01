import 'package:fitervari/contracts/transfer/set_history.dart';
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/exercise_chart.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/finished_button.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/quit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class DoExercisePage extends StatefulWidget {
  static const routeName = '/doExercise';

  Exercise currentExercise;
  int currentSetNumber;
  WorkoutHistory workoutHistory;

  @override
  State<StatefulWidget> createState() => DoExercisePageState();
}

class DoExercisePageState extends State<DoExercisePage> {
  double currentWeight;
  int currentRep;

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    currentWeight = 50;
    currentRep = 10;
  }

  @override
  Widget build(BuildContext context) {
    List<Object> arguments = ModalRoute.of(context).settings.arguments;

    widget.currentExercise = arguments[0];
    widget.currentSetNumber = arguments[1];
    widget.workoutHistory = arguments[2];

    return Consumer<WorkoutProvider>(
      builder: (context, workoutProvider, child) {
        var deviceHeight =
            MediaQuery.of(context).size.height - SessionInfo().actionBarHeight;
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            height: double.maxFinite,
            child: Column(
              children: <Widget>[
                ExerciseChart(
                  data: workoutProvider.currentWorkout.workoutHistories,
                  currentExercise: widget.currentExercise,
                  currentSetNumber: widget.currentSetNumber,
                ),
                Container(
                  height: deviceHeight * 0.25,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Row(
                          children: <Widget>[
                            NumberPicker.decimal(
                              initialValue: currentWeight,
                              minValue: 1,
                              maxValue: 500,
                              listViewWidth: 80,
                              onChanged: (value) =>
                                  setState(() => this.currentWeight = value),
                            ),
                            Text('kg',
                                style: TextStyle(fontWeight: FontWeight.bold))
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
                              maxValue: 50,
                              listViewWidth: 60,
                              onChanged: (value) =>
                                  setState(() => this.currentRep = value),
                            ),
                            Text(
                              'x',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                FinishedButton(widget.currentExercise, widget.currentSetNumber,
                    this.finishSet),
                QuitButton(),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        );
      },
    );
  }

  void finishSet() {
    var exerciseHistory =
        getCurrentValidExerciseHistory(widget.currentSetNumber);

    exerciseHistory.setHistories.add(new SetHistory(
        id: -1,
        time: -1,
        distance: -1,
        weight: currentWeight,
        repetitions: currentRep,
        setNumber: widget.currentSetNumber));

    widget.workoutHistory.exerciseHistories.add(exerciseHistory);
    if (widget.currentSetNumber == widget.currentExercise.standardSetNr) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      Navigator.pushNamed(context, DoExercisePage.routeName, arguments: [
        widget.currentExercise,
        widget.currentSetNumber + 1,
        widget.workoutHistory
      ]);
    }
  }

  ExerciseHistory getCurrentValidExerciseHistory(int setNumber) {
    ExerciseHistory result;
    if (setNumber == 1) {
      result = new ExerciseHistory(
          id: -1,
          exercise_id: widget.currentExercise.id,
          setHistories: new List<SetHistory>());
      widget.workoutHistory.exerciseHistories.add(result);
    } else {
      widget.workoutHistory.exerciseHistories.forEach((element) {
        if(element.exercise_id == widget.currentExercise.id){
          result = element;
        }
      });
    }
    return result;
  }
}
