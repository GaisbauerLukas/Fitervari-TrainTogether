import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';
import 'package:fitervari/contracts/applicationProperties.dart';

class WorkoutEndpoint extends GenericEndpoint<Workout> {

  WorkoutEndpoint(){
    this.baseUrl = applicationProperties.url + "workout";
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
