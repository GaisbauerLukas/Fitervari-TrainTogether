import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:flutter/material.dart';

class WorkoutProvider extends ChangeNotifier {
  Workout _nextWorkout;
  List<Workout> _loadedWorkouts;

  Workout get nextWorkout =>_nextWorkout;
  List<Workout> get loadedWorkouts => _loadedWorkouts;


  void setNextWorkout(Workout workout) {
    _nextWorkout = workout;
  }
}
