import 'package:fitervari/contracts/identifiable.dart';
import 'package:flutter/material.dart';

class Customer extends Identifiable{

  final String name;
  final DateTime joinDate;
  final DateTime memberTill;
  final bool cashCustomer;
  final String imageUrl;
  final int trainer_id;

  Customer({
    @required id,
    @required this.name,
    @required this.joinDate,
    @required this.memberTill,
    @required this.cashCustomer,
    @required this.imageUrl,
    @required this.trainer_id
  }) : super(id);

}