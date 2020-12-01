import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';

class WorkoutEndpoint extends GenericEndpoint<Workout> {

  WorkoutEndpoint(){
    this.baseUrl = 'http://10.0.2.2:80/api/workout';
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
