
import 'package:fitervari/contracts/application_properties.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';

class WorkoutHistoryEndpoint extends GenericEndpoint<WorkoutHistory> {

  WorkoutHistoryEndpoint(){
    this.baseUrl = ApplicationProperties.url + 'workoutHistory';
  }

  @override
  WorkoutHistory convertJsonToObject(dataItem) {
    return WorkoutHistory.fromJson(dataItem);
  }

  @override
  Map<String, dynamic> convertObjectToJson(WorkoutHistory data) {
    return data.toJson();
  }
  
}