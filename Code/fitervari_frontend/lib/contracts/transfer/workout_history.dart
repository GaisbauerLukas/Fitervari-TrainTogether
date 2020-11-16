import 'package:fitervari/contracts/identifiable.dart';
import 'package:fitervari/contracts/transfer/workout.dart';

import 'exercise_history.dart';

class WorkoutHistory extends Identifiable {
  int id;
  DateTime date;
  Workout workout;
  List<ExerciseHistory> exerciseHistories;

  WorkoutHistory(int id) : super(id);
}