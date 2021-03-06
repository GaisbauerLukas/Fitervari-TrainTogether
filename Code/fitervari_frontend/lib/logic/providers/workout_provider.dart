import 'dart:developer';

import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/network/workout_endpoint.dart';
import 'package:fitervari/logic/network/workout_history_endpoint.dart';
import 'package:flutter/material.dart';

class WorkoutProvider extends ChangeNotifier {
  Workout _currentWorkout;

  List<Workout> _loadedWorkouts;

  Workout _creationWorkout;

  Workout get creationWorkout => _creationWorkout;

  set creationWorkout(Workout value) {
    _creationWorkout = value;
  }

  Workout get currentWorkout => _currentWorkout;

  List<Workout> get loadedWorkouts => _loadedWorkouts;

  WorkoutEndpoint _endpoint;
  WorkoutHistoryEndpoint _workoutHistoryEndpoint;

  WorkoutProvider() {
    _endpoint = WorkoutEndpoint();
    _workoutHistoryEndpoint = WorkoutHistoryEndpoint();
    _loadedWorkouts = new List<Workout>();
  }

  loadWorkouts(String token) {
    try {
      _endpoint.getAll(token).then((value) {
        _loadedWorkouts.clear();
        _loadedWorkouts.addAll(value);

        if(value.length != 0) {
          _currentWorkout = _loadedWorkouts[0];
        }

        notifyListeners();
      });
    } catch (error) {
      loadWorkouts(token);
    }
  }

  void setNextWorkout(Workout workout) {
    _currentWorkout = workout;
    notifyListeners();
  }

  void postWorkoutHistoryToCurrentWorkout(
      WorkoutHistory workoutHistory, Future<String> token) async {

    currentWorkout.workoutHistories.add(workoutHistory);
    _endpoint.put(currentWorkout, await token)
        .then((value) => log(value.toString()));
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
        notifyListeners();
      }
    });
  }

  postWorkout(Workout workout, String token) {
    _endpoint.post(workout, token).then((value) {
      if (value != null) {

        if(_loadedWorkouts.contains(workout)){
          _loadedWorkouts[_loadedWorkouts.indexOf(workout)] = value;
        } else {
          _loadedWorkouts.add(value);
        }

        notifyListeners();
      }
    });
  }

  updateWorkout(Workout workout, String token) {
    _endpoint.put(workout, token).then((value) {
      if (value) {
        for (var element in loadedWorkouts) {
          if (element.id == workout.id) {
            element = workout;
          }
          notifyListeners();
        }
      }
    });
  }

  deleteWorkout(Workout workout, String token) {
    _endpoint.delete(workout.id, token).then((value) {
      if (value != false) {
        loadedWorkouts.remove(workout);
        notifyListeners();
      }
    });
  }

  clearData() {
    _currentWorkout = null;
    _loadedWorkouts.clear();
  }
}
