import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:fitervari/views/news_letter_details_page/NewsLetterDetailsPage.dart';
import 'package:fitervari/widgets/provider_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './views/tabs_screen/tabs_screen.dart';
import './logic/providers/news_letters_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //dated package work this out sometime later
      builder: (ctx) => NewsLettersProvider(),
      child: ProviderApp()
    );
  }
}
