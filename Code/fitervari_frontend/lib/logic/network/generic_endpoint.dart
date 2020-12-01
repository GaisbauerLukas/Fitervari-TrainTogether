import 'dart:convert';

import 'package:fitervari/contracts/identifiable.dart';
import 'package:http/http.dart' as http;

abstract class GenericEndpoint<T extends Identifiable> {
  String baseUrl;

  T convertJsonToObject(dynamic dataItem);

  Map<String, dynamic> convertObjectToJson(T item);

  Future<List<T>> getAll() async {
    List<T> result = [];

    final response = await http.get(this.baseUrl);
    final data = json.decode(response.body);

    data.forEach((dataItem) {
      var tmp = this.convertJsonToObject(dataItem);
      result.add(tmp);
    });

    return result;
  }

  Future<bool> post(T postItem) async {
    final response = await http.post(this.baseUrl,
        headers: {"content-type": "application/json"},
        body: this.convertObjectToJson(postItem));
    return response.statusCode == 201;
  }

  Future<bool> put(T putItem) async {
    final response = await http.put(this.baseUrl + "${putItem.id})",
        headers: {"content-type": "application/json"},
        body: this.convertObjectToJson(putItem));
    return response.statusCode == 201;
  }

  Future<bool> delete(int id) async {
    final response = await http.put(
      this.baseUrl + '/$id',
      headers: {"content-type": "application/json"},
    );
    return response.statusCode == 201;
  }
}
