import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './sub_widgets/start_workout_button.dart';
import './sub_widgets/change_workout_button.dart';
import './sub_widgets/info_item_scroll_view.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsLettersProvider>(
        builder: (context, newsLetterProvider, child) {
          return Column(
            children: <Widget>[
              //TODO this should be dynamic and from called from the server
              InfoItemScrollView(newsLetterProvider.items),
              InfoItemScrollView(newsLetterProvider.items.reversed),
              StartWorkoutButton(),
              ChangeWorkoutButton()
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
          );
        }
    );

  }
}
