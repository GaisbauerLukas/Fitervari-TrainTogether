import 'package:fitervari/contracts/identifiable.dart';

class Person extends Identifiable {
  String name;
  String keycloakName;
  DateTime joinDate;
  DateTime memberTill;
  bool trainer;
  bool cashCustomer;

  Person.named({id, this.name, this.trainer}) : super(id);
  Person(id, this.name, this.trainer) : super(id);

  Person.fromJson(dynamic json) : super(json["id"]) {
    name = json["name"];
    keycloakName = json["keycloakName"];
    trainer = json["trainer"];
    cashCustomer = json["cashCustomer"];
    joinDate = DateTime.parse(json["joinDate"]);

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["trainer"] = trainer;
    map["cashCustomer"] = cashCustomer;
    return map;
  }
}
