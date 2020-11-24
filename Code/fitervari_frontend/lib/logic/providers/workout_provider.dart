import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:flutter/material.dart';

class WorkoutProvider extends ChangeNotifier {
  static const url = 'http://10.0.2.2:8080/api/workout';

  Workout _nextWorkout;
  List<Workout> _items = [];

  Workout get nextWorkout =>_nextWorkout;
  List<Workout> get getWorkouts => _items;


  void setNextWorkout(Workout workout) {
    _nextWorkout = workout;
  }

  List<Workout> get items {
    return [..._items];
  }
}
