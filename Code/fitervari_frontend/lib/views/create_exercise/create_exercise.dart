import 'package:fitervari/contracts/transfer/customer.dart';
import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/contracts/transfer/set.dart';
import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/providers/authentication_provider.dart';
import 'package:fitervari/logic/providers/exercise_provider.dart';
import 'package:fitervari/views/workout_edit_view/sub_widgets/exercise_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateExercise extends StatelessWidget {
  static const routeName = "/Create_Exercise";
  Workout workout;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseProvider>(builder: (context, provider, child) {
      final nameController = TextEditingController();
      final exerciseTypController = TextEditingController();
      final numberOfSetController = TextEditingController();
      Customer person;
      workout = ModalRoute.of(context).settings.arguments;

      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                controller: nameController,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Übungs Typ',
                ),
                controller: exerciseTypController,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Standart Anzahl von Sätzen',
                ),
                controller: numberOfSetController,
              ),
            ),
            Container(
              child: Consumer<AuthenticationProvider>(
                builder: (context, authProvider, child) {
                  return InkWell(
                    onTap: () async => {
                      provider.addExercises(
                        Exercise(
                            creationDate: DateTime.now(),
                            creator: null,
                            officialFlag: false,
                            name: nameController.text,
                            exerciseType: exerciseTypController.text,
                            standardSetNr: int.parse(numberOfSetController.text),
                            sets: List<Set>()
                        ),
                        await authProvider.token
                      ),
                      Navigator.pop(context),
                      Navigator.pop(context),
                      Navigator.of(context).pushNamed(ExerciseList.routeName, arguments: this.workout),
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Theme.of(context).primaryColor,
                      elevation: 4,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Neue Exercise erstellen',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w100),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ),
          ]),
        ),
      );
    });
  }
}
