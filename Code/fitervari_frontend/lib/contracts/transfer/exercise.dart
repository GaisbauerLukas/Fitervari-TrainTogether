import 'package:fitervari/contracts/identifiable.dart';
import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/contracts/transfer/set.dart';

class Exercise extends Identifiable {
  DateTime creationDate;
  Person creator;
  String exerciseType;
  String name;
  bool officialFlag;
  List<Set> sets;
  int standardSetNr;

  Exercise(
      {id,
      this.creationDate,
      this.creator,
      this.exerciseType,
      this.name,
      this.officialFlag,
      this.sets,
      this.standardSetNr})
      : super(id);

  Exercise.fromJson(dynamic json) : super(json["id"]) {
    creationDate = DateTime.parse(json["creationDate"]);
    creator = json["creator"] != null ? Person.fromJson(json["creator"]) : null;
    exerciseType = json["exerciseType"];
    name = json["name"];
    officialFlag = json["officialFlag"];
    if (json["sets"] != null) {
      sets = [];
      json["sets"].forEach((v) {
        sets.add(Set.fromJson(v));
      });
    }
    standardSetNr = json["standardSetNr"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["creationDate"] = creationDate.toIso8601String();
    if (creator != null) {
      map["creator"] = creator.toJson();
    }
    map["exerciseType"] = exerciseType;
    map["name"] = name;
    map["officialFlag"] = officialFlag;
    if (sets != null) {
      map["sets"] = sets.map((v) => v.toJson()).toList();
    }
    map["standardSetNr"] = standardSetNr;
    return map;
  }
}
