import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:fitervari/views/news_letter_details_page/NewsLetterDetailsPage.dart';
import 'package:fitervari/views/tabs_screen/tabs_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ContentAppState();
}

class _ContentAppState extends State<ContentApp> {

  ThemeData _theme;

  @override
  void initState() {
    super.initState();
    Provider.of<NewsLettersProvider>(context, listen: false).loadNewsLetters();
    Provider.of<SettingsProvider>(context, listen: false).setLightTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(builder: (context, provider, child) {
      _theme = provider.currentTheme;
      return MaterialApp(
        title: 'Fitervari',
        theme: _theme,
        home: TabsScreen(),
        routes: {
          FillerPage.routeName: (ctx) => FillerPage(),
          NewsLetterDetailsPage.routeName: (ctx) => NewsLetterDetailsPage(),
        },
      );
    },);
  }

}
