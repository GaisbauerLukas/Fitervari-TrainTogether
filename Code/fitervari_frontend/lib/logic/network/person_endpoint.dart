
import 'dart:convert';

import 'package:fitervari/contracts/application_properties.dart';
import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';
import 'package:http/http.dart' as http;

class PersonEndpoint extends GenericEndpoint<Person>{

  PersonEndpoint() {
    this.baseUrl = ApplicationProperties.url + "person";
  }
  @override
  Person convertJsonToObject(dataItem) {
    return Person.fromJson(dataItem);
  }

  @override
  Map<String, dynamic> convertObjectToJson(Person data) {
    return data.toJson();
  }

  Future<Person> getCurrentPerson(String token) async {
    try {

      final response = await http.get(this.baseUrl, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });

      final data = json.decode(response.body);

      return this.convertJsonToObject(data);

    } catch (error) {
      return getCurrentPerson(token);
    }
  }

}