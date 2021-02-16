import 'package:fitervari/contracts/transfer/customer.dart';
import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/logic/providers/exercise_provider.dart';
import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/create_workout_page/create_workout_page.dart';
import 'package:fitervari/views/do_exercise_page/do_exercise_page.dart';
import 'package:fitervari/views/exercise_view/create_exercise.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
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
    setProvider();
  }

  setProvider() {
    Provider.of<NewsLettersProvider>(context, listen: false).loadNewsLetters();
    Provider.of<SettingsProvider>(context, listen: false).setLightTheme();
    Provider.of<WorkoutProvider>(context, listen: false).loadWorkouts();
    Provider.of<ExerciseProvider>(context, listen: false).loadExercises();
    Provider.of<CustomerProvider>(context, listen: false).setCurrentCustomer(
        Customer(
            id: 2,
            cashCustomer: true,
            joinDate: DateTime.utc(2019, 5, 12),
            memberTill: DateTime.utc(2021, 5, 12),
            pictureId: -1,
            trainer: false,
            name: 'Angelo Merte',
            trainerId: 3));
  }

  @override
  Widget build(BuildContext context) {
    setProvider();
    return Consumer<SettingsProvider>(
      builder: (context, provider, child) {
        _theme = provider.currentTheme;
        return MaterialApp(
          title: 'Fitervari',
          theme: _theme,
          home: TabsScreen(),
          routes: {
            FillerPage.routeName: (ctx) => FillerPage(),
            NewsLetterDetailsPage.routeName: (ctx) => NewsLetterDetailsPage(),
            WorkoutRoutine.routeName: (ctx) => WorkoutRoutine(),
            DoExercisePage.routeName: (ctx) => DoExercisePage(),
            WorkoutEditView.routeName: (ctx) => WorkoutEditView(),
            ExerciseList.routeName: (ctx) => ExerciseList(),
            CreateExercise.routeName: (ctx) => CreateExercise(),
            CreateWorkoutPage.routeName: (ctx) => CreateWorkoutPage(),
          },
        );
      },
    );
  }
}
