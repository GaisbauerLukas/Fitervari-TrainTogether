import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/logic/network/exercise_endpoint.dart';
import 'package:flutter/material.dart';

class ExerciseProvider extends ChangeNotifier{
  List<Exercise> _exercises;

  List<Exercise> get exercises => _exercises;

  ExerciseEndpoint _endpoint;

  ExerciseProvider(){
    _endpoint = ExerciseEndpoint();
    _exercises = [];
  }

  loadExercises() async{
    _exercises = [];
    var tmp = await _endpoint.getAll();
    _exercises.addAll(tmp);
    notifyListeners();
  }

}