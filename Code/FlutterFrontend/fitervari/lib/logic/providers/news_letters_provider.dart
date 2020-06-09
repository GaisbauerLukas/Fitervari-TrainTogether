import 'package:flutter/cupertino.dart';

import '../../contracts/news_letter.dart';

class NewsLettersProvider with ChangeNotifier{
  List<NewsLetter> _items = [];

  List<NewsLetter> get items {
    //return a copy of the items list
    return [..._items];
  }

}