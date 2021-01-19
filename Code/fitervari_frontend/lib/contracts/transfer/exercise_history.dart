import 'package:fitervari/contracts/identifiable.dart';
import 'package:flutter/cupertino.dart';

import 'set_history.dart';

class ExerciseHistory extends Identifiable {
  // from database
  int exerciseId;
  List<SetHistory> setHistories;

  //business
  bool isFinished;

  ExerciseHistory(
      {@required int id,
      @required this.exerciseId,
      @required this.setHistories})
      : super(id);

  ExerciseHistory.fromJson(dynamic json) : super(json["id"]) {
    exerciseId = json["exercise_id"];
    if (json["setHistories"] != null) {
      setHistories = [];
      json["setHistories"].forEach((v) {
        setHistories.add(SetHistory.fromJson(v));
      });
    }
    // when a ExerciseHistory is coming from the
    // database it is assumed that the exercise is already finished
    this.isFinished = true;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["exercise_id"] = exerciseId;
    if (setHistories != null) {
      map["setHistories"] = setHistories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
