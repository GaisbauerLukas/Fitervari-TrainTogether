import 'package:fitervari/contracts/transfer/person.dart';
import 'package:flutter/material.dart';

class Customer extends Person {
  DateTime joinDate;
  DateTime memberTill;
  bool cashCustomer;
  int trainerId;

  Customer(
      {@required id,
      @required String name,
      @required pictureId,
      @required trainer,
      @required this.joinDate,
      @required this.memberTill,
      @required this.cashCustomer,
      @required this.trainerId})
      : super(id, name, pictureId, trainer);

  Customer.fromJson(dynamic json) : super.fromJson(json) {
    joinDate = json["joinDate"];
    memberTill = json["memberTill"];
    cashCustomer = json["cashCustomer"];
    trainerId = json["trainerId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = super.id;
    map["Trainer"] = true;
    map["name"] = super.name;
    map["pictureId"] = super.pictureId;
    map["joinDate"] = joinDate.toIso8601String();
    map["memberTill"] = memberTill.toIso8601String();
    map["cashCustomer"] = cashCustomer;
    map["trainerId"] = trainerId;
    return map;
  }
}
