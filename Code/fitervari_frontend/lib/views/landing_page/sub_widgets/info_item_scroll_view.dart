import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_item.dart';
import '../../../contracts/news_letter.dart';

class InfoItemScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsLetterData = Provider.of<NewsLettersProvider>(context);

    return Container(
      height: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return InfoItem(newsLetterData.items[index]);
        },
        itemCount: newsLetterData.items.length,
      ),
    );
  }
}
