import 'package:fitervari/contracts/transfer/customer.dart';
import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './sub_widgets/start_workout_button.dart';
import './sub_widgets/change_workout_button.dart';
import './sub_widgets/info_item_scroll_view.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {

  setProvider() {
    Provider.of<NewsLettersProvider>(context, listen: false).loadNewsLetters();
    Provider.of<SettingsProvider>(context, listen: false).setLightTheme();
    Provider.of<WorkoutProvider>(context, listen: false).loadWorkouts();
    Provider.of<CustomerProvider>(context, listen: false).setCurrentCustomer(
        Customer(
            id: -1,
            cashCustomer: true,
            joinDate: DateTime.utc(2019, 5, 12),
            memberTill: DateTime.utc(2021, 5, 12),
            name: 'Florian Geht',
            trainerId: 2));
    // test komentar
  }

  @override
  void initState() {
    super.initState();
    setProvider();
  }


  @override
  Widget build(BuildContext context) {
    setProvider();
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
