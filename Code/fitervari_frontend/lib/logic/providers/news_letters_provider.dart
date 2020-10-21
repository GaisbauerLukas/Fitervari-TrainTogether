import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../contracts/news_letter.dart';

class NewsLettersProvider extends ChangeNotifier {
  //when testing on a virtual device: 10.0.2.2
  static const url = 'http://10.0.2.2:8080/api/newsletter';

  List<NewsLetter> _items = [];

  List<NewsLetter> get items {
    return [..._items];
  }

  Future<List<NewsLetter>> loadNewsLetters() async {
    try {
      if (_items.length == 0) {
        final response = await http.get(url);
        final data = json.decode(response.body);

        final List<NewsLetter> loadedNewsLetter = [];

        data.forEach((item) {
          loadedNewsLetter.add(NewsLetter(
              id: item['id'],
              title: item['title'],
              body: item['body'],
              imageUrl: item['imageUrl']));
        });

        _items.addAll(loadedNewsLetter);
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }
}
