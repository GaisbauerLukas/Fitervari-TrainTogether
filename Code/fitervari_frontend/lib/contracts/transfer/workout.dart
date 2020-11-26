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
    creationDate = json["creation_Date"];
    creator = json["creator"] != null ? Person.fromJson(json["creator"]) : null;
    if (json["exercises"] != null) {
      exercises = [];
      json["exercises"].forEach((v) {
        exercises.add(Exercise.fromJson(v));
      });
    }
    name = json["name"];
    officialFlag = json["official_Flag"];
    if (json["workouthistories"] != null) {
      workoutHistories = [];
      json["workouthistories"].forEach((v) {
        workoutHistories.add(WorkoutHistory.fromJson(v));
      });
    }
  }
}
