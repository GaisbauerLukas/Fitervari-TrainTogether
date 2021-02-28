import 'dart:convert';

import 'package:fitervari/contracts/application_properties.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';
import 'package:http/http.dart' as http;

class WorkoutEndpoint extends GenericEndpoint<Workout> {
  WorkoutEndpoint() {
    this.baseUrl = ApplicationProperties.url + 'workout';
  }

  @override
  Map<String, dynamic> convertObjectToJson(data) {
    return data.toJson();
  }

  @override
  Workout convertJsonToObject(dataItem) {
    var tmp = Workout.fromJson(dataItem);
    return tmp;
  }
}
