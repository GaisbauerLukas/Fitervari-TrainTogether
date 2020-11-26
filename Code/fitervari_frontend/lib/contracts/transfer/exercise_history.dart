import 'package:fitervari/contracts/identifiable.dart';
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:flutter/cupertino.dart';

import 'set_history.dart';

class ExerciseHistory extends Identifiable {
  Exercise exercise;
  List<SetHistory> setHistories;

  ExerciseHistory(
      {@required int id, @required this.exercise, @required this.setHistories})
      : super(id);

  ExerciseHistory.fromJson(dynamic json) : super(json["id"]) {
    if (json["setHistories"] != null) {
      setHistories = [];
      json["setHistories"].forEach((v) {
        setHistories.add(SetHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    if (setHistories != null) {
      map["setHistories"] = setHistories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
