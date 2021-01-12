import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fitervari/contracts/util/chart_entity.dart';
import 'package:fitervari/logic/helper/session_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseChart extends StatelessWidget {
  final List<ChartEntity> data;
  final String name;

  ExerciseChart({@required this.data, @required this.name});

  @override
  Widget build(BuildContext context) {
    var deviceHeight =
        MediaQuery.of(context).size.height - SessionInfo().actionBarHeight;

    List<charts.Series<ChartEntity, String>> series = [
      charts.Series(
          id: "ExerciseHistory",
          data: data,
          domainFn: (ChartEntity histories, _) => histories.date.toString(),
          measureFn: (ChartEntity histories, _) => histories.yValue,
          colorFn: (ChartEntity histories, _) => histories.barColor)
    ];

    return Container(
      height: deviceHeight * 0.35,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                this.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
