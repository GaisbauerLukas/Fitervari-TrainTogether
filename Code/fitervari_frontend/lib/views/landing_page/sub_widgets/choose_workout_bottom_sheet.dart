import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/providers/settings_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ChooseWorkoutButtonSheet extends StatefulWidget {

  Function updateParent;

  ChooseWorkoutButtonSheet(this.updateParent);

  @override
  State<StatefulWidget> createState() => ChooseWorkoutButtonSheetState();
}

class ChooseWorkoutButtonSheetState extends State<ChooseWorkoutButtonSheet> {
  @override
  Widget build(BuildContext context) {

    return Consumer<SettingsProvider>(
      builder: (context, provider, child) {

        return Container(
          color: provider.currentTheme.backgroundColor,
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(5),
          child: Consumer<WorkoutProvider>(
            builder: (context, provider, child) {

              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var workout = provider.loadedWorkouts[index];

                  return Card(
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        provider.setNextWorkout(workout);
                        widget.updateParent();
                        Navigator.pop(context);
                      },
                      title: Text(
                        workout.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        workout.creator != null
                            ? 'Erstell von: ' + workout.creator.name
                            : 'Erstellt von: dir',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                },
                itemCount: provider.loadedWorkouts.length,
              );

            },
          ),
        );
      },
    );
  }
}
