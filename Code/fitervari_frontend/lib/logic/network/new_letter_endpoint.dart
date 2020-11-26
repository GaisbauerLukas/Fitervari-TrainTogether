import 'package:fitervari/contracts/transfer/news_letter.dart';
import 'package:fitervari/logic/network/generic_endpoint.dart';

class NewsLetterEndpoint extends GenericEndpoint<NewsLetter> {
  NewsLetterEndpoint() {
    this.baseUrl = 'http://10.0.2.2:8080/api/newsletter';
  }

  @override
  NewsLetter convertJsonToObject(dataItem) {
    return NewsLetter(
        id: dataItem['id'],
        title: dataItem['title'],
        body: dataItem['body'],
        imageUrl: dataItem['imageUrl']);
  }

  @override
  Map<String, dynamic> convertObjectToJson(NewsLetter item) {
    var map = <String, dynamic>{};
    map["id"] = item.id;
    map["body"] = item.body;
    map["imageUrl"] = item.imageUrl;
    map["title"] = item.title;
    return map;
  }
}
