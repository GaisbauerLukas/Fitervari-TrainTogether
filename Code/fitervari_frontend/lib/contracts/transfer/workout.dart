import 'package:fitervari/contracts/identifiable.dart';
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:flutter/cupertino.dart';

class Workout extends Identifiable {
  // from database
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
    if (json["creation_Date"] != null) {
      creationDate = DateTime.parse(json["creation_Date"]);
    }
    // creator = json["creator"] != null ? Person.fromJson(json["creator"]) : null;
    if (json["exercises"] != null) {
      exercises = [];
      json["exercises"].forEach((v) {
        exercises.add(Exercise.fromJson(v));
      });
    }
    name = json["name"];
    officialFlag = json["officialFlag"];
    if (json["creator"] != null) {
      creator = Person.fromJson(json["creator"]);
    }
    if (json["workoutHistories"] != null) {
      workoutHistories = [];
      json["workoutHistories"].forEach((v) {
        workoutHistories.add(WorkoutHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    if (creationDate != null) {
      map["creationDate"] = creationDate.toIso8601String();
    }
    if (creator != null) {
      map["creator"] = creator.toJson();
    }
    if (exercises != null) {
      map["exercises"] = exercises.map((v) => v.toJson()).toList();
    }
    map["name"] = name;
    map["officialFlag"] = officialFlag;
    if (workoutHistories != null) {
      map["workoutHistories"] =
          workoutHistories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
