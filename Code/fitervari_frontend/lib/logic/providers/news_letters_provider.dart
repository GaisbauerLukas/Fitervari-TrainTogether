import 'package:fitervari/contracts/transfer/news_letter.dart';
import 'package:fitervari/logic/network/new_letter_endpoint.dart';
import 'package:flutter/material.dart';

class NewsLettersProvider extends ChangeNotifier {
  //when testing on a virtual device: 10.0.2.2
  static const url = 'http://10.0.2.2:8080/api/newsletter';

  NewsLetterEndpoint endpoint = NewsLetterEndpoint();

  List<NewsLetter> _items = new List<NewsLetter>();

  List<NewsLetter> get items {
    return [..._items];
  }

  Future<List<NewsLetter>> loadNewsLetters(String token) {
    try {
      if (_items.length == 0) {
        endpoint.getAll(token).then((value) {
          _items.addAll(value);
          notifyListeners();
        });
      }
    } catch (error) {
      loadNewsLetters(token);
    }
  }
}
