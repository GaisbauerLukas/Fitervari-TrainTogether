import 'package:fitervari/contracts/transfer/person.dart';

/// id : 2
/// creationDate : "2020-09-30T10:26:55"
/// creator : {"id":2,"_Trainer":false,"name":"Jack Mickelson","pictureId":-1,"cashCostumer":true,"joinDate":"2020-09-30T00:00:00Z[UTC]","memberTill":"2020-12-30T00:00:00Z[UTC]","myTrainer":{"id":3,"_Trainer":false,"name":"Schwarzenegger","pictureId":-1,"trainerSince":"2020-09-30"}}
/// exerciseType : "strength"
/// name : "PushUps"
/// officialFlag : false
/// standardSetNr : 3

class Exercise {
  int _id;
  DateTime _creationDate;
  Person _creator;
  String _exerciseType;
  String _name;
  bool _officialFlag;
  int _standardSetNr;
  List<Set> _sets;

  int get id => _id;
  DateTime get creationDate => _creationDate;
  Person get creator => _creator;
  String get exerciseType => _exerciseType;
  String get name => _name;
  bool get officialFlag => _officialFlag;
  int get standardSetNr => _standardSetNr;
  List<Set> get sets => _sets;

  Exercise(
      {int id,
      DateTime creationDate,
      Person creator,
      String exerciseType,
      String name,
      bool officialFlag,
      int standardSetNr,
      List<Set> sets}) {
    _id = id;
    _creationDate = creationDate;
    _creator = creator;
    _exerciseType = exerciseType;
    _name = name;
    _officialFlag = officialFlag;
    _standardSetNr = standardSetNr;
    _sets = sets;
  }

  Exercise.fromJson(dynamic json) {
    _id = json["id"];
    _creationDate = json["creationDate"];
    _creator =
        json["creator"] != null ? Person.fromJson(json["creator"]) : null;
    _exerciseType = json["exerciseType"];
    _name = json["name"];
    _officialFlag = json["officialFlag"];
    _standardSetNr = json["standardSetNr"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["creationDate"] = _creationDate;
    if (_creator != null) {
      map["creator"] = _creator.toJson();
    }
    map["exerciseType"] = _exerciseType;
    map["name"] = _name;
    map["officialFlag"] = _officialFlag;
    map["standardSetNr"] = _standardSetNr;
    return map;
  }
}