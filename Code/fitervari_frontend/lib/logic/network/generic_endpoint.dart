import 'dart:convert';

import 'package:fitervari/contracts/identifiable.dart';
import 'package:http/http.dart' as http;

abstract class GenericEndpoint<T extends Identifiable> {
  String baseUrl;

  T convertJsonToObject(dynamic dataItem);

  Map<String, dynamic> convertObjectToJson(T item);

  Future<List<T>> getAll(String token) async {
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
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> post(T postItem) async {
    final jsonBeforeEncoding = this.convertObjectToJson(postItem);
    final encoded = json.encode(jsonBeforeEncoding);

    final response = await http.post(this.baseUrl,
        headers: {"content-type": "application/json"}, body: encoded);
    return response.statusCode == 201;
  }

  Future<bool> put(T putItem) async {
    try {
      final response = await http.put(this.baseUrl,
          headers: {"content-type": "application/json"},
          body: json.encode(this.convertObjectToJson(putItem)));
      return response.statusCode == 201;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> delete(int id) async {
    final response = await http.delete(
      this.baseUrl + '$id',
      headers: {"content-type": "application/json"},
    );
    return response.statusCode == 200;
  }
}
