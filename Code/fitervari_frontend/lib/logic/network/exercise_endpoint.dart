import 'package:fitervari/contracts/application_properties.dart';
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';

class ExerciseEndpoint extends GenericEndpoint<Exercise>{
  ExerciseEndpoint(){
    this.baseUrl = ApplicationProperties.url + 'exercises/';
  }
  @override
  Exercise convertJsonToObject(dataItem) {
    return Exercise.fromJson(dataItem);
  }

  @override
  Map<String, dynamic> convertObjectToJson(Exercise item) {
    return item.toJson();
  }

}