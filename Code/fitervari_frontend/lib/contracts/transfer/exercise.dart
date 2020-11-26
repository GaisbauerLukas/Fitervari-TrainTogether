import 'package:fitervari/contracts/identifiable.dart';
import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/contracts/transfer/set.dart';

/// id : 2
/// creationDate : "2020-09-30T10:26:55"
/// creator : {"id":2,"_Trainer":false,"name":"Jack Mickelson","pictureId":-1,"cashCostumer":true,"joinDate":"2020-09-30T00:00:00Z[UTC]","memberTill":"2020-12-30T00:00:00Z[UTC]","myTrainer":{"id":3,"_Trainer":false,"name":"Schwarzenegger","pictureId":-1,"trainerSince":"2020-09-30"}}
/// exerciseType : "strength"
/// name : "PushUps"
/// officialFlag : false
/// standardSetNr : 3

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
    creationDate = json["creationDate"];
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
    map["creationDate"] = creationDate;
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
