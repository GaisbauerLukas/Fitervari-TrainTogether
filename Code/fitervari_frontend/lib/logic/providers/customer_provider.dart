import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/logic/network/person_endpoint.dart';
import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier {
  static const url = 'http://10.0.2.2:8080/api/person/';

  PersonEndpoint personEndpoint;

  Person _currentCustomer;

  CustomerProvider() {
    personEndpoint = new PersonEndpoint();
  }

  void setCurrentCustomer(Person newCustomer) {
    this._currentCustomer = newCustomer;
  }

  Person getCurrentCustomer() {
    return _currentCustomer;
  }

  void loadCurrentCustomer(String token) async {
    personEndpoint.getCurrentPerson(token).then((value) {
      _currentCustomer = value;
    });
  }
}
