import 'package:fitervari/contracts/identifiable.dart';
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:flutter/cupertino.dart';

class Workout extends Identifiable {
  String name;
  DateTime creationDate;
  Person creator;
  bool officialFlag;
  List<Exercise> exercises;
  List<WorkoutHistory> workoutHistories;

  Workout(
      {@required int id,
      @required this.name,
      @required this.creationDate,
      @required this.creator,
      @required this.officialFlag,
      @required this.exercises,
      @required this.workoutHistories})
      : super(id);

  Workout.fromJson(dynamic json) : super(json["id"]) {
    name = json["name"];
    creationDate = json["creationDate"];
    // TODO place here a fromJson constructor of trainer/customer
    creator = null;
    officialFlag = json["officialFlag"];
  }
}
