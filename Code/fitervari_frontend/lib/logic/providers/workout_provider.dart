import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/network/workout_endpoint.dart';
import 'package:flutter/material.dart';

class WorkoutProvider extends ChangeNotifier {
  Workout _currentWorkout;
  List<Workout> _loadedWorkouts;

  Workout get currentWorkout => _currentWorkout;

  List<Workout> get loadedWorkouts => _loadedWorkouts;

  WorkoutEndpoint endpoint;

  WorkoutProvider() {
    endpoint = WorkoutEndpoint();
    _loadedWorkouts = [];
  }

  loadWorkouts() async {
    var tmp = await endpoint.getAll();
    _loadedWorkouts.addAll(tmp);
    //TODO change this later
    _currentWorkout = _loadedWorkouts[0];
  }

  void setNextWorkout(Workout workout) {
    _currentWorkout = workout;
  }

  void addWorkoutHistoryToCurrentWorkout(WorkoutHistory workoutHistory) {
    if (currentWorkout != null && currentWorkout.workoutHistories != null) {
      _currentWorkout.workoutHistories.add(workoutHistory);
    }
  }

  void addWorkoutHistory(int workoutId, WorkoutHistory workoutHistory) {
    _loadedWorkouts.forEach((element) {
      if (element.workoutHistories != null && element.id == workoutId) {
        element.workoutHistories.add(workoutHistory);
      }
    });
  }
}
