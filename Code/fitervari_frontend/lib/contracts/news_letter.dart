import 'package:fitervari/contracts/identifiable.dart';
import 'package:flutter/cupertino.dart';

class NewsLetter extends Identifiable {
  final String title;
  final String body;
  final String imageUrl;

  const NewsLetter({
    @required id,
    @required this.title,
    @required this.body,
    @required this.imageUrl,
  }) : super(id);
}
