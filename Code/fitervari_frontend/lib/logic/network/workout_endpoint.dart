import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';

class WorkoutEndpoint extends GenericEndpoint<Workout> {


  @override
  Map<String, dynamic> convertObjectToJson(data) {
    // TODO: implement convertObjectToJson
    throw UnimplementedError();
  }

  @override
  Workout convertJsonToObject(dataItem) {
    return Workout(

    );
  }
}
