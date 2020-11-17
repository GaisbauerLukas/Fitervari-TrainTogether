import 'package:fitervari/contracts/identifiable.dart';
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:flutter/cupertino.dart';

import 'SetHistory.dart';

class ExerciseHistory extends Identifiable {
  Exercise exercise;
  List<SetHistory> setHistories;

  ExerciseHistory(
      {@required int id, @required this.exercise, @required this.setHistories})
      : super(id);
}
