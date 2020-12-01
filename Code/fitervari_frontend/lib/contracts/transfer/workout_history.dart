import 'package:fitervari/contracts/identifiable.dart';

import 'package:flutter/cupertino.dart';

import 'exercise_history.dart';

class WorkoutHistory extends Identifiable {
  DateTime date;
  List<ExerciseHistory> exerciseHistories;

  WorkoutHistory(
      {@required id, @required this.date, @required this.exerciseHistories})
      : super(id);

  WorkoutHistory fromJson(dynamic json) {
    date = DateTime.parse(json["date"]);
    if (json["exerciseHistories"] != null) {
      exerciseHistories = [];
      json["exerciseHistories"].forEach((v) {
        exerciseHistories.add(ExerciseHistory.fromJson(v));
      });
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["date"] = date;
    if (exerciseHistories != null) {
      map["exerciseHistories"] =
          exerciseHistories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
