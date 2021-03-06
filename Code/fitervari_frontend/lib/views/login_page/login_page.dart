import 'package:fitervari/logic/providers/authentication_provider.dart';
import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/logic/providers/exercise_provider.dart';
import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/tabs_screen/tabs_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  setProvider(Future<String> token) {
    token.then((value) {
      Provider.of<NewsLettersProvider>(context, listen: false)
          .loadNewsLetters(value);
      Provider.of<SettingsProvider>(context, listen: false).setLightTheme();
      Provider.of<WorkoutProvider>(context, listen: false).loadWorkouts(value);
      Provider.of<ExerciseProvider>(context, listen: false)
          .loadExercises(value);
      Provider.of<CustomerProvider>(context, listen: false)
          .loadCurrentCustomer(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return refresh();
  }

  Widget refresh() {
    return FutureBuilder(
        future: Provider.of<AuthenticationProvider>(context, listen: false)
            .refreshToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.data == true &&
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .isLoggedIn) {
            return loadApp();
          } else if (snapshot.hasData && snapshot.data == false) {
            return login();
          } else if (snapshot.hasError) {
            Provider.of<AuthenticationProvider>(context, listen: false)
                .logoutAction();
            return Container();
          } else {
            return Container();
          }
        });
  }

  Widget login() {
    return FutureBuilder(
        future: Provider.of<AuthenticationProvider>(context, listen: false)
            .loginAction(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return loadApp();
          } else if (snapshot.hasError ||
              (snapshot.hasData && snapshot.data == false)) {
            Provider.of<AuthenticationProvider>(context, listen: false)
                .logoutAction();
            return Container();
          } else {
            return Container();
          }
        });
  }

  Widget loadApp() {
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, child) {
        return FutureBuilder(
          future: setProvider(provider.token),
          builder: (context, snapshot) => TabsScreen(),
        );
      },
    );
  }
}
