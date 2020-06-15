import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../contracts/news_letter.dart';

class NewsLettersProvider with ChangeNotifier {
  //when testing on a virtual device: 10.0.2.2
  static const url = 'http://vm117.htl-leonding.ac.at:80/api/newsletter';

  bool _loaded = false;

  List<NewsLetter> _items = [
    /*
    NewsLetter(
      id: 1,
      title: 'Alles neu',
      body: 'As you go through life you are going to have many opportunities to keep your mouth shut. Take advantage of all of them.',
      imageUrl: 'https://worldofmusicfans.com/wp-content/uploads/2019/09/Movin-On.jpg'
    ),
    NewsLetter(
        id: 2,
        title: 'So wie noch nie',
        body: '	As you go through life you are going to have many opportunities to keep your mouth shut. Take advantage of all of them.',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgb50TR36ss8UrHOm16NibmN4XijJEmf3WOjNibGB1ab1DDR7g&usqp=CAU'
    ),
    NewsLetter(
        id: 3,
        title: 'Alles neu',
        body: '	As you go through life you are going to have many opportunities to keep your mouth shut. Take advantage of all of them.',
        imageUrl: 'https://produzizivot.com/wp-content/uploads/2020/03/Best-NCS-Workout-Songs-Mix-Bodybuilding-Motivation-NoCopyrightSounds-Mali-Doca-3.png'
    ),
    NewsLetter(
        id: 4,
        title: 'Mach dich bereit',
        body: '	As you go through life you are going to have many opportunities to keep your mouth shut. Take advantage of all of them.',
        imageUrl: 'https://secureservercdn.net/184.168.47.225/4b4.026.myftpupload.com/wp-content/uploads/2013/12/HeaderBG1.jpg'
    ),
    */
  ];

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
