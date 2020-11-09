import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'content_app.dart';

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: SettingsProvider()),
      ChangeNotifierProvider.value(value: CustomerProvider()),
      ChangeNotifierProvider.value(value: NewsLettersProvider()),
      ChangeNotifierProvider.value(value: WorkoutProvider())
    ], child: ContentApp());
  }
}
