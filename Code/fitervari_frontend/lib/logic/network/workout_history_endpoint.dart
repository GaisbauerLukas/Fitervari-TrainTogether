
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';

class WorkoutHistoryEndpoint extends GenericEndpoint<WorkoutHistory> {

  WorkoutHistoryEndpoint(){
    this.baseUrl = 'http://10.0.2.2:8080/api/workouthistory';
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