import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:flutter/material.dart';

class WorkoutProvider extends ChangeNotifier {

  Workout _currentWorkout;
  List<Workout> _loadedWorkouts;

  Workout get currentWorkout =>_currentWorkout;
  List<Workout> get loadedWorkouts => _loadedWorkouts;


  void setNextWorkout(Workout workout) {
    _currentWorkout = workout;
  }
  
  void addWorkoutHistoryToCurrentWorkout(WorkoutHistory workoutHistory) {
    _currentWorkout.workoutHistories.add(workoutHistory);
  }

  void addWorkoutHistory(int workoutId, WorkoutHistory workoutHistory) {
    _loadedWorkouts.forEach((element) {
      if(element.id == workoutId){
        element.workoutHistories.add(workoutHistory);
      }
    });
  }
}
