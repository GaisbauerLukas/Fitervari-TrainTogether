import 'package:fitervari/contracts/identifiable.dart';
import 'package:flutter/cupertino.dart';

class Set extends Identifiable {
  int repetitions;
  double distance;
  double weight;
  double time;
  int setNumber;
  String type;

  Set(
      {id,
      @required this.repetitions,
      @required this.distance,
      @required this.weight,
      @required this.time,
      @required this.setNumber,
      @required this.type})
      : super(id);

  Set.fromJson(dynamic json) : super(json["id"]) {
    distance = json["distance"];
    repetitions = json["repetitions"];
    setNumber = json["setNumber"];
    time = json["time"];
    type = json["type"];
    weight = json["weight"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["distance"] = distance;
    map["repetitions"] = repetitions;
    map["setNumber"] = setNumber;
    map["time"] = time;
    map["type"] = type;
    map["weight"] = weight;
    return map;
  }
}
