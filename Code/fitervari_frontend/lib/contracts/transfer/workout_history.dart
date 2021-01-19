import 'package:fitervari/contracts/identifiable.dart';

import 'package:flutter/cupertino.dart';

import 'exercise_history.dart';

class WorkoutHistory extends Identifiable {

  // from database
  DateTime date;
  List<ExerciseHistory> exerciseHistories;

  //business fields

  WorkoutHistory(
      {@required id, @required this.date, @required this.exerciseHistories})
      : super(id);

  WorkoutHistory.fromJson(dynamic json) : super(json["id"]) {
    date = DateTime.parse(json["date"]);
    if (json["exerciseHistories"] != null) {
      exerciseHistories = [];
      json["exerciseHistories"].forEach((v) {
        exerciseHistories.add(ExerciseHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date.toIso8601String();
    if (exerciseHistories != null) {
      map['exerciseHistories'] =
          exerciseHistories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
