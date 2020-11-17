import 'package:flutter/material.dart';


class MyWorkouts extends StatelessWidget {
  const MyWorkouts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      elevation: 2,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Meine Workouts',
              textScaleFactor: 2,
            ),
            //TODO Listview wäre hier sinnvoller
            ListTile(
              // leading: Icon(Icons.directions_run),
              title: Text('Brustraining'),
              subtitle: Text('Trainer: Detlef D! Soost'),
            ),
            ListTile(
              // leading: Icon(Icons.directions_run),
              title: Text('Rückenworkout'),
              subtitle: Text('Trainer: Sven Müller'),
            ),
            ListTile(
              // leading: Icon(Icons.directions_run),
              title: Text('Schulterworkout'),
              subtitle: Text('Trainer: Sven Müller'),
            )
          ],
        ),
      ),
    );
  }
}
