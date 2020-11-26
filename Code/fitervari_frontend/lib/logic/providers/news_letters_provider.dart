import 'dart:convert';

import 'package:fitervari/contracts/transfer/news_letter.dart';
import 'package:fitervari/logic/network/new_letter_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsLettersProvider extends ChangeNotifier {
  //when testing on a virtual device: 10.0.2.2
  static const url = 'http://10.0.2.2:8080/api/newsletter';

  NewsLetterEndpoint endpoint = NewsLetterEndpoint();

  List<NewsLetter> _items = [];

  List<NewsLetter> get items {
    return [..._items];
  }

  Future<List<NewsLetter>> loadNewsLetters() async {
    try {
      if (_items.length == 0) {
        _items.addAll(await endpoint.getAll());
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }
}
