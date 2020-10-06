import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../contracts/news_letter.dart';

class NewsLettersProvider with ChangeNotifier {
  //when testing on a virtual device: 10.0.2.2
  static const url = 'http://10.0.2.2:8080/api/newsletter';

  bool _loaded = false;

  List<NewsLetter> _items = [];

  List<NewsLetter> get items {
    //return a copy of the items list
    if (!_loaded) {
      _loadNewsLetters();
      _loaded = true;
    }
    return [..._items];
  }

  Future<List<NewsLetter>> _loadNewsLetters() async {
    try {
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
    } catch (error) {
      throw error;
    }
  }
}
