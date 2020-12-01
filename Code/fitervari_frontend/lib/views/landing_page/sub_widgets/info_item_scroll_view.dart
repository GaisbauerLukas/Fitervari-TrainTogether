import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_item.dart';

class InfoItemScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsLettersProvider>(
        builder: (context, newsLetterProvider, child) {
      return Container(
        height: (MediaQuery.of(context).size.height -
                SessionInfo().actionBarHeight) *
            0.23,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return InfoItem(newsLetterProvider.items[index]);
          },
          itemCount: newsLetterProvider.items.length,
        ),
      );
    });
  }
}
