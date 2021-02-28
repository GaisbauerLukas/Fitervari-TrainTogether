import 'package:fitervari/logic/providers/authentication_provider.dart';
import 'package:fitervari/logic/providers/workout_provider.dart';
import 'package:fitervari/views/workout_edit_view/sub_widgets/exercise_list.dart';
import 'package:fitervari/views/workout_edit_view/sub_widgets/exercise_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutEditView extends StatefulWidget {
  static const routeName = '/WorkoutEditView';

  //const WorkoutEditView({ Key key, this.workout }) : super(key: key);

  @override
  State<StatefulWidget> createState() => WorkoutEditViewState();
}

class WorkoutEditViewState extends State<WorkoutEditView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, workoutProvider, child) {
        workoutProvider.creationWorkout =
            ModalRoute
                .of(context)
                .settings
                .arguments;

        return Consumer<AuthenticationProvider>(
          builder: (context, authProvider, child) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                tooltip: 'Save',
                child: Icon(Icons.save),
                onPressed: () async {
                      workoutProvider.postWorkout(workoutProvider.creationWorkout,
                          await authProvider.token);
                      Navigator.pop(context);
                      setState(() {

                      });
                },
              ),
              appBar: AppBar(
                actions: <Widget>[
                  IconButton(
                    onPressed: () async {
                      final value = await Navigator.pushNamed(
                          context, ExerciseList.routeName,
                          arguments: workoutProvider.creationWorkout);
                      setState(() {});
                    },
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  )
                ],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      onChanged: (text) =>
                      workoutProvider.creationWorkout.name = text,
                      initialValue: workoutProvider.creationWorkout.name,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Name',
                        // counterText: '0 characters',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  if (workoutProvider.creationWorkout == null ||
                      workoutProvider.creationWorkout.exercises.isEmpty)
                    Text("No exercises Added")
                  else
                    Expanded(
                      child: Container(
                        height: 500,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (ctx, index) {
                              return ExerciseTile(
                                  workoutProvider.creationWorkout
                                      .exercises[index],
                                  workoutProvider.creationWorkout);
                            },
                            itemCount:
                            workoutProvider.creationWorkout.exercises.length),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
