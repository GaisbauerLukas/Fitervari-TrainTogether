/// id : 2
/// creationDate : "2020-09-30T10:26:55"
/// creator : {"id":2,"_Trainer":false,"name":"Jack Mickelson","pictureId":-1,"cashCostumer":true,"joinDate":"2020-09-30T00:00:00Z[UTC]","memberTill":"2020-12-30T00:00:00Z[UTC]","myTrainer":{"id":3,"_Trainer":false,"name":"Schwarzenegger","pictureId":-1,"trainerSince":"2020-09-30"}}
/// exerciseType : "strength"
/// name : "PushUps"
/// officialFlag : false
/// standardSetNr : 3

class Exercise {
  int _id;
  String _creationDate;
  Creator _creator;
  String _exerciseType;
  String _name;
  bool _officialFlag;
  int _standardSetNr;

  int get id => _id;

  String get creationDate => _creationDate;

  Creator get creator => _creator;

  String get exerciseType => _exerciseType;

  String get name => _name;

  bool get officialFlag => _officialFlag;

  int get standardSetNr => _standardSetNr;

  Exercise(
      {int id,
      String creationDate,
      Creator creator,
      String exerciseType,
      String name,
      bool officialFlag,
      int standardSetNr}) {
    _id = id;
    _creationDate = creationDate;
    _creator = creator;
    _exerciseType = exerciseType;
    _name = name;
    _officialFlag = officialFlag;
    _standardSetNr = standardSetNr;
  }

  Exercise.fromJson(dynamic json) {
    _id = json["id"];
    _creationDate = json["creationDate"];
    _creator =
        json["creator"] != null ? Creator.fromJson(json["creator"]) : null;
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

/// id : 2
/// _Trainer : false
/// name : "Jack Mickelson"
/// pictureId : -1
/// cashCostumer : true
/// joinDate : "2020-09-30T00:00:00Z[UTC]"
/// memberTill : "2020-12-30T00:00:00Z[UTC]"
/// myTrainer : {"id":3,"_Trainer":false,"name":"Schwarzenegger","pictureId":-1,"trainerSince":"2020-09-30"}

class Creator {
  int _id;
  bool _trainer;
  String _name;
  int _pictureId;
  bool _cashCostumer;
  String _joinDate;
  String _memberTill;
  MyTrainer _myTrainer;

  int get id => _id;

  bool get trainer => _trainer;

  String get name => _name;

  int get pictureId => _pictureId;

  bool get cashCostumer => _cashCostumer;

  String get joinDate => _joinDate;

  String get memberTill => _memberTill;

  MyTrainer get myTrainer => _myTrainer;

  Creator(
      {int id,
      bool trainer,
      String name,
      int pictureId,
      bool cashCostumer,
      String joinDate,
      String memberTill,
      MyTrainer myTrainer}) {
    _id = id;
    _trainer = trainer;
    _name = name;
    _pictureId = pictureId;
    _cashCostumer = cashCostumer;
    _joinDate = joinDate;
    _memberTill = memberTill;
    _myTrainer = myTrainer;
  }

  Creator.fromJson(dynamic json) {
    _id = json["id"];
    _trainer = json["Trainer"];
    _name = json["name"];
    _pictureId = json["pictureId"];
    _cashCostumer = json["cashCostumer"];
    _joinDate = json["joinDate"];
    _memberTill = json["memberTill"];
    _myTrainer = json["myTrainer"] != null
        ? MyTrainer.fromJson(json["myTrainer"])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["Trainer"] = _trainer;
    map["name"] = _name;
    map["pictureId"] = _pictureId;
    map["cashCostumer"] = _cashCostumer;
    map["joinDate"] = _joinDate;
    map["memberTill"] = _memberTill;
    if (_myTrainer != null) {
      map["myTrainer"] = _myTrainer.toJson();
    }
    return map;
  }
}

/// id : 3
/// _Trainer : false
/// name : "Schwarzenegger"
/// pictureId : -1
/// trainerSince : "2020-09-30"

class MyTrainer {
  int _id;
  bool _trainer;
  String _name;
  int _pictureId;
  String _trainerSince;

  int get id => _id;

  bool get trainer => _trainer;

  String get name => _name;

  int get pictureId => _pictureId;

  String get trainerSince => _trainerSince;

  MyTrainer(
      {int id, bool trainer, String name, int pictureId, String trainerSince}) {
    _id = id;
    _trainer = trainer;
    _name = name;
    _pictureId = pictureId;
    _trainerSince = trainerSince;
  }

  MyTrainer.fromJson(dynamic json) {
    _id = json["id"];
    _trainer = json["Trainer"];
    _name = json["name"];
    _pictureId = json["pictureId"];
    _trainerSince = json["trainerSince"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["Trainer"] = _trainer;
    map["name"] = _name;
    map["pictureId"] = _pictureId;
    map["trainerSince"] = _trainerSince;
    return map;
  }
}
