import 'package:fitervari/contracts/transfer/news_letter.dart';
import 'package:fitervari/logic/helper/session_info.dart';
import 'package:flutter/material.dart';

import 'info_item.dart';

class InfoItemScrollView extends StatelessWidget {
  final Iterable<NewsLetter> newsLetters;

  InfoItemScrollView(this.newsLetters);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) *
              0.23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return InfoItem(newsLetters.toList()[index]);
        },
        itemCount: newsLetters.length,
      ),
    );
  }
}
