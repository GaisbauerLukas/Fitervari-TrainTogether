import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';

class ExerciseEndpoint extends GenericEndpoint<Exercise>{
  @override
  Exercise convertJsonToObject(dataItem) {
    // TODO: implement convertJsonToObject
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> convertObjectToJson(Exercise item) {
    // TODO: implement convertObjectToJson
    throw UnimplementedError();
  }

}