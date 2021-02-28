import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/views/create_workout_page/create_workout_page.dart';
import 'package:fitervari/views/do_exercise_page/do_exercise_page.dart';
import 'package:fitervari/views/create_exercise/create_exercise.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:fitervari/views/login_page/login_page.dart';
import 'package:fitervari/views/news_letter_details_page/NewsLetterDetailsPage.dart';
import 'package:fitervari/views/tabs_screen/tabs_screen.dart';
import 'package:fitervari/views/workout_edit_view/sub_widgets/exercise_list.dart';
import 'package:fitervari/views/workout_edit_view/workout_edit_view.dart';
import 'package:fitervari/views/workout_routine/workout_routine.dart';
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
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<SettingsProvider>(
      builder: (context, provider, child) {

        provider.setLightTheme();
        _theme = provider.currentTheme;

        return MaterialApp(
          title: 'Fitervari',
          theme: _theme,
          home: LoginPage(),
          routes: {
            FillerPage.routeName: (ctx) => FillerPage(),
            NewsLetterDetailsPage.routeName: (ctx) => NewsLetterDetailsPage(),
            WorkoutRoutine.routeName: (ctx) => WorkoutRoutine(),
            DoExercisePage.routeName: (ctx) => DoExercisePage(),
            WorkoutEditView.routeName: (ctx) => WorkoutEditView(),
            ExerciseList.routeName: (ctx) => ExerciseList(),
            CreateExercise.routeName: (ctx) => CreateExercise(),
            CreateWorkoutPage.routeName: (ctx) => CreateWorkoutPage(),
            TabsScreen.routeName: (ctx) => TabsScreen(),
            LoginPage.routeName: (ctx) => LoginPage()
          },
        );
      },
    );
  }

}
