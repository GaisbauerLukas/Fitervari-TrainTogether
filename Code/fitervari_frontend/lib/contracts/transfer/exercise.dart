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
    standardSetNr = json["standardSet"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (id != null) {
      map["id"] = id;
    }
    map["name"] = name;
    map["exerciseType"] = exerciseType;
    map["officialFlag"] = officialFlag;
    map["standardSet"] = standardSetNr;
    map["creationDate"] = creationDate.toIso8601String();

    if (creator != null) {
      map["creator"] = creator.toJson();
    }

    if (sets != null) {
      map["sets"] = sets.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
