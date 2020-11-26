import 'package:fitervari/contracts/identifiable.dart';
import 'package:flutter/cupertino.dart';

class SetHistory extends Identifiable {
  double time;
  double distance;
  double weight;
  int repetitions;
  int setNumber;

  SetHistory(
      {@required int id,
      @required this.time,
      @required this.distance,
      @required this.weight,
      @required this.repetitions,
      @required this.setNumber})
      : super(id);

  SetHistory.fromJson(dynamic json) : super(json["id"]) {
    distance = json["distance"];
    repetitions = json["repetitions"];
    setNumber = json["setNumber"];
    time = json["time"];
    weight = json["weight"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["distance"] = distance;
    map["repetitions"] = repetitions;
    map["setNumber"] = setNumber;
    map["time"] = time;
    map["weight"] = weight;
    return map;
  }
}
