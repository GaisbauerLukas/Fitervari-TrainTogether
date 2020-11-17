import 'package:fitervari/contracts/transfer/customer.dart';
import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier {
  static const url = 'http://192.168.0.192:8080/api/customer/';
  static const String userId = '2';

  Customer _currentCustomer;

  void setCurrentCustomer(Customer newCustomer) {
    this._currentCustomer = newCustomer;
  }

  Customer getCurrentCustomer() {
    return _currentCustomer;
  }
}
