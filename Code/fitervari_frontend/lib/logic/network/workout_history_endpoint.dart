
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';

class WorkoutHistoryEndpoint extends GenericEndpoint<WorkoutHistory> {
  @override
  WorkoutHistory convertJsonToObject(dataItem) {
    
  }

  @override
  Map<String, > convertObjectToJson(WorkoutHistory data) {
    // TODO: implement convertObjectToJson
    throw UnimplementedError();
  }
  
}