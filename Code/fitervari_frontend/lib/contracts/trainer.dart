import 'package:fitervari/contracts/person.dart';

class Trainer extends Person {
  String trainerSince;

  Trainer({int id, String name, int pictureId, String trainerSince})
      : super(id, name, pictureId) {
    trainerSince = trainerSince;
  }

  Trainer.fromJson(dynamic json) : super.fromJson(json) {
    trainerSince = json["trainerSince"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = super.id;
    map["Trainer"] = true;
    map["name"] = super.name;
    map["pictureId"] = super.pictureId;
    map["trainerSince"] = trainerSince;
    return map;
  }
}
