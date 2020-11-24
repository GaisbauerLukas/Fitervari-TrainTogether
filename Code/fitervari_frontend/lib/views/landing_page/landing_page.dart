import 'package:flutter/material.dart';

import './sub_widgets/start_workout_button.dart';
import './sub_widgets/change_workout_button.dart';
import './sub_widgets/info_item_scroll_view.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //TODO this should be dynamic and from called from the server
        InfoItemScrollView(),
        InfoItemScrollView(),
        StartWorkoutButton(),
        ChangeWorkoutButton()
      ],
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
