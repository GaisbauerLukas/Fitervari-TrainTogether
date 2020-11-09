import 'package:fitervari/contracts/identifiable.dart';

class Person extends Identifiable {
  String name;

  // later implement here a photo
  int pictureId;

  Person(id, this.name, this.pictureId) : super(id);

  Person.fromJson(dynamic json) : super(json["id"]) {
    name = json["name"];
    pictureId = json["pictureId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = this.id;
    map["name"] = this.name;
    map["pictureId"] = this.pictureId;
    return map;
  }
}
