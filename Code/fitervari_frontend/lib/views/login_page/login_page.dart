import 'package:fitervari/contracts/transfer/customer.dart';
import 'package:fitervari/logic/providers/authentication_provider.dart';
import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/logic/providers/news_letters_provider.dart';
import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/tabs_screen/tabs_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

// The user should supply their own username and password.
  String username = '';
  String password = '';

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
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SettingsProvider>(context, listen: false).setLightTheme();
    return Consumer<SettingsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    onChanged: (value) =>
                        this.setState(() => this.username = value),
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) =>
                        this.setState(() => this.password = value),
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: FlatButton(
                      color: provider.currentTheme.primaryColor,
                      onPressed: () {
                        AuthenticationProvider()
                            .login(username, password)
                            .then((value) => new AuthenticationProvider().client = value)
                            .then((value) => setProvider());
                        Navigator.pushNamed(context, TabsScreen.routeName);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
