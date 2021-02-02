import 'package:fitervari/contracts/identifiable.dart';

class Person extends Identifiable {
  String name;

  // later implement here a photo
  int pictureId;
  bool trainer;

  Person.named({id, this.name, this.pictureId, this.trainer}) : super(id);
  Person(id, this.name, this.pictureId, this.trainer) : super(id);

  Person.fromJson(dynamic json) : super(json["id"]) {
    name = json["name"];
    pictureId = json["pictureId"];
    trainer = json["trainer"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["pictureId"] = pictureId;
    map["trainer"] = trainer;
    return map;
  }
}
