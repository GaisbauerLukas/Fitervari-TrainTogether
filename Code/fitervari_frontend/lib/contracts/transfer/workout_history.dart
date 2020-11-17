import 'package:fitervari/contracts/identifiable.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:flutter/cupertino.dart';

import 'exercise_history.dart';

class WorkoutHistory extends Identifiable {
  int id;
  DateTime date;
  List<ExerciseHistory> exerciseHistories;

  WorkoutHistory(
      {@required id,
      @required this.date,
      @required this.exerciseHistories})
      : super(id);
}
