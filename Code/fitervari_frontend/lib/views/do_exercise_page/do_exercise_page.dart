import 'package:carousel_slider/carousel_slider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/contracts/transfer/set_history.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/contracts/util/chart_entity.dart';
import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/exercise_chart.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/finished_button.dart';
import 'package:fitervari/views/do_exercise_page/sub_widgets/quit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class DoExercisePage extends StatefulWidget {
  static const routeName = '/doExercise';

  Exercise currentExercise;
  int currentSetNumber;
  WorkoutHistory workoutHistory;
  void Function(ExerciseHistory exerciseHistory) setExerciseHistoryToTrue;

  @override
  State<StatefulWidget> createState() => DoExercisePageState();
}

class DoExercisePageState extends State<DoExercisePage> {
  double currentWeight;
  int currentRep;

  int _currentIndex = 0;

  List<Widget> cardList = [];

  @override
  void initState() {
    super.initState();
    currentWeight = 50;
    currentRep = 10;
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List<ChartEntity> convertToChartEntity(List<WorkoutHistory> data,
      ChartEntity Function(ExerciseHistory history, DateTime date) generator) {
    List<ChartEntity> result = [];

    for (final current in data) {
      current.exerciseHistories.forEach((element) {
        if (element.exerciseId == widget.currentExercise.id &&
            element.setHistories.length - 1 >= widget.currentSetNumber - 1) {
          result.add(generator(element, current.date));
        }
      });
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<Object> arguments = ModalRoute.of(context).settings.arguments;

    widget.currentExercise = arguments[0];
    widget.currentSetNumber = arguments[1];
    widget.workoutHistory = arguments[2];
    widget.setExerciseHistoryToTrue = arguments[3];

    return Consumer<WorkoutProvider>(

      builder: (context, workoutProvider, child) {

        var currentWorkout = workoutProvider.currentWorkout;

        var deviceHeight =
            MediaQuery.of(context).size.height - SessionInfo().actionBarHeight;
        this.cardList.clear();

        this.cardList.addAll([
          ExerciseChart(
            data: convertToChartEntity(
                currentWorkout.workoutHistories,
                (history, date) => ChartEntity(
                    date: DateFormat('dd.MM.yy').format(date),
                    yValue: history
                        .setHistories[widget.currentSetNumber - 1].weight,
                    barColor: charts.ColorUtil.fromDartColor(Colors.blue))),
            name: 'Gewicht',
          ),
          ExerciseChart(
            data: convertToChartEntity(
                currentWorkout.workoutHistories,
                (history, date) => ChartEntity(
                    date: DateFormat('dd.MM.yy').format(date),
                    yValue: history
                        .setHistories[widget.currentSetNumber - 1].repetitions
                        .toDouble(),
                    barColor: charts.ColorUtil.fromDartColor(Colors.blue))),
            name: 'Wiederholungen',
          ),
          ExerciseChart(
            data: convertToChartEntity(
                currentWorkout.workoutHistories,
                (history, date) => ChartEntity(
                    date: DateFormat('dd.MM.yy').format(date),
                    yValue: history.setHistories[widget.currentSetNumber - 1]
                            .repetitions *
                        history
                            .setHistories[widget.currentSetNumber - 1].weight,
                    barColor: charts.ColorUtil.fromDartColor(Colors.blue))),
            name: 'Gesamt Fortschritt',
          )
        ]);

        return Scaffold(
          appBar: AppBar(),
          body: Container(
            height: double.maxFinite,
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    height: deviceHeight * 0.3,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 16.9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),    //if this is the
                  items: cardList.map((card) {
                    return Builder(builder: (BuildContext context) {
                      return card;
                    });
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    );
                  }),
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
                            Text(
                              'kg',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
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

    // add sethistory to current exercisehistory
    exerciseHistory.setHistories.add(new SetHistory(
        id: null,
        time: -1,
        distance: -1,
        weight: currentWeight,
        repetitions: currentRep,
        setNumber: widget.currentSetNumber));

    if (widget.currentSetNumber == widget.currentExercise.standardSetNr) {
      Navigator.pop(context);
      widget.setExerciseHistoryToTrue(exerciseHistory);
    } else {
      Navigator.pop(context);
      Navigator.pushNamed(context, DoExercisePage.routeName, arguments: [
        widget.currentExercise,
        widget.currentSetNumber + 1,
        widget.workoutHistory,
        widget.setExerciseHistoryToTrue
      ]);
    }
  }

  ExerciseHistory getCurrentValidExerciseHistory(int setNumber) {
    ExerciseHistory result;
    if (setNumber == 1) {
      result = new ExerciseHistory(
          id: null,
          exerciseId: widget.currentExercise.id,
          setHistories: new List<SetHistory>());
      widget.workoutHistory.exerciseHistories.add(result);
    } else {
      widget.workoutHistory.exerciseHistories.forEach((element) {
        if (element.exerciseId == widget.currentExercise.id) {
          result = element;
        }
      });
    }
    return result;
  }
}
