import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/exercise_history.dart';
import 'package:fitervari/contracts/transfer/set_history.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/contracts/transfer/workout_history.dart';
import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/do_exercise_page/do_exercise_page.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:fitervari/views/news_letter_details_page/NewsLetterDetailsPage.dart';
import 'package:fitervari/views/tabs_screen/tabs_screen.dart';
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
    // this data is set for develop and debug purposes
    var tmp = Exercise(
        creator: null,
        officialFlag: false,
        name: 'Pushups',
        id: 1,
        creationDate: DateTime.now(),
        exerciseType: 'strength',
        standardSetNr: 3);

    var setHistory2 = SetHistory(
        id: 2,
        distance: -1,
        repetitions: 12,
        setNumber: 1,
        time: -1,
        weight: 60);

    var exerciseHistory2 =
        ExerciseHistory(id: 2, exercise_id: tmp.id, setHistories: [setHistory2]);

    var workoutHistory2 = WorkoutHistory(
        id: 2,
        date: DateTime.parse("2020-11-11"),
        exerciseHistories: [exerciseHistory2]);

    Provider.of<NewsLettersProvider>(context, listen: false).loadNewsLetters();
    Provider.of<SettingsProvider>(context, listen: false).setLightTheme();
    Provider.of<WorkoutProvider>(context, listen: false).loadWorkouts();
    // Provider.of<WorkoutProvider>(context, listen: false).setNextWorkout(Workout(
    //     exercises: [tmp],
    //     creationDate: DateTime.now(),
    //     id: 1,
    //     name: 'test',
    //     officialFlag: false,
    //     workoutHistories: [workoutHistory2],
    //     creator: null));
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
            DoExercisePage.routeName: (ctx) => DoExercisePage()
          },
        );
      },
    );
  }
}
