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
      @required this.joinDate,
      @required this.memberTill,
      @required this.cashCustomer,
      @required this.trainerId})
      : super(id, name, pictureId);

}
