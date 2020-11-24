import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExerciseChart extends StatelessWidget {
  final List<WorkoutHistory> data;
  final Exercise currentExercise;
  final int currentSetNumber;

  ExerciseChart(
      {@required this.data,
      @required this.currentExercise,
      @required this.currentSetNumber});

  @override
  Widget build(BuildContext context) {
    var chartDisplay = List<WeightExerciseChartDisplay>();
    var deviceHeight = MediaQuery.of(context).size.height - SessionInfo().actionBarHeight;
    for (final current in data) {
      current.exerciseHistories.forEach((element) {
        if (element.exercise.id == currentExercise.id) {
          chartDisplay.add(WeightExerciseChartDisplay(
              date: DateFormat('dd.MM.yy').format(current.date),
              weight: element.setHistories[currentSetNumber].weight,
              barColor: charts.ColorUtil.fromDartColor(Colors.blue)));
        }
      });
    }

    List<charts.Series<WeightExerciseChartDisplay, String>> series = [
      charts.Series(
          id: "ExerciseHistory",
          data: chartDisplay,
          domainFn: (WeightExerciseChartDisplay histories, _) =>
              histories.date.toString(),
          measureFn: (WeightExerciseChartDisplay histories, _) =>
              histories.weight,
          colorFn: (WeightExerciseChartDisplay histories, _) =>
              histories.barColor)
    ];

    return Container(
      height: deviceHeight * 0.35,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "ExerciseHistory",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WeightExerciseChartDisplay {
  final String date;
  final double weight;
  final charts.Color barColor;

  WeightExerciseChartDisplay({
    @required this.date,
    @required this.weight,
    @required this.barColor,
  });
}
