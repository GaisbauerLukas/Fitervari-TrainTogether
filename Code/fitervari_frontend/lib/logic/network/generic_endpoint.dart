import 'dart:convert';

import 'package:fitervari/contracts/identifiable.dart';
import 'package:http/http.dart' as http;

abstract class GenericEndpoint<T extends Identifiable> {
  String baseUrl;

  T convertJsonToObject(dynamic dataItem);

  Map<String, dynamic> convertObjectToJson(T item);

  Future<List<T>> getAll(String token) async {
    try {
      List<T> result = [];

      final response = await http.get(this.baseUrl, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8'
      });

      final data = json.decode(response.body);

      data.forEach((dataItem) {
        var tmp = this.convertJsonToObject(dataItem);
        result.add(tmp);
      });

      return result;
    } catch (error) {
      return getAll(token);
    }
  }

  Future<Object> post(T postItem, String token) async {
    try {
      final msg = this.convertObjectToJson(postItem);
      final msgString = json.encode(msg);
      final response = await http.post(this.baseUrl,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: msgString);
      if (response.statusCode == 403) {
        return post(postItem, token);
      } else {
        return convertJsonToObject(json.decode(response.body));
      }
    } catch (error) {
      print(error);
    }
  }

  Future<Object> put(T putItem, String token) async {
    try {
      final response = await http.put(this.baseUrl,
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer $token'
          },
          body: json.encode(this.convertObjectToJson(putItem)));

      return response.body;
    } catch (error) {}
  }

  Future<bool> delete(int id, String token) async {
    try {
      final response = await http.delete(
        this.baseUrl + '/$id',
        headers: {
          'Authorization': 'Bearer $token'
          },
      );
      if (response.statusCode == 403) {
        return delete(id, token);
      } else {
        return response.statusCode == 200;
      }
    } catch (error) {
      print(error);
    }
  }
}
