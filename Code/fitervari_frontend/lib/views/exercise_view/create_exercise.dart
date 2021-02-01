import 'package:fitervari/contracts/transfer/exercise.dart';
import 'package:fitervari/contracts/transfer/person.dart';
import 'package:fitervari/logic/providers/exercise_provider.dart';
import 'package:fitervari/views/workout_edit_view/sub_widgets/exercise_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateExercise extends StatelessWidget {
  static const routeName = "/Create_Exercise";

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseProvider>(builder: (context, provider, child) {
      final nameController = TextEditingController();
      final exerciseTypController = TextEditingController();
      final numberOfSetController = TextEditingController();
      Person person;

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
              child: InkWell(
                onTap: () => {
                  person = Person.named(name: "Test"),
                  provider.addExercises(
                    Exercise(
                      creationDate: DateTime.now(),
                      creator: person,
                      officialFlag: false,
                      name: nameController.text,
                      exerciseType: exerciseTypController.text,
                      standardSetNr: int.parse(numberOfSetController.text),
                    ),
                  ),
                  Navigator.of(context).pushNamed(ExerciseList.routeName),
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
              ),
            ),
          ]),
        ),
      );
    });
  }
}
