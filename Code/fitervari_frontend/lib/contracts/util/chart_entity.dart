import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartEntity {
  final String date;
  final double yValue;
  final charts.Color barColor;

  ChartEntity({
    @required this.date,
    @required this.yValue,
    @required this.barColor,
  });
}