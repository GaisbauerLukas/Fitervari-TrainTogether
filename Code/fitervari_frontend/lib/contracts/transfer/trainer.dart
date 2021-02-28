import 'package:fitervari/contracts/transfer/person.dart';
import 'package:flutter/cupertino.dart';

class Trainer extends Person {
  String trainerSince;

  Trainer(
      {@required int id,
      @required String name,
      @required int pictureId,
        @required bool trainer,
      @required this.trainerSince})
      : super(id, name, trainer);

  Trainer.fromJson(dynamic json) : super.fromJson(json) {
    trainerSince = json["trainerSince"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = super.id;
    map["Trainer"] = true;
    map["name"] = super.name;
    map["trainerSince"] = trainerSince;
    return map;
  }
}
