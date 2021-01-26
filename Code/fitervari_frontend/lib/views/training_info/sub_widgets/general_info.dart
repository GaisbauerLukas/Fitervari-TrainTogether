import 'package:flutter/material.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Allgemeine Info',
              textScaleFactor: 1,
              style: TextStyle(fontSize: 25),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Letztes Workout'),
              subtitle: Text(
                'Rückenworkout',
                style: TextStyle(fontSize: 15),
              ),
              dense: true,
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Letzter Termin'),
              subtitle: Text('13.03.2020', style: TextStyle(fontSize: 15)),
              dense: true,
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Sven Müller'),
              subtitle: Text('13.03.2020', style: TextStyle(fontSize: 15)),
              dense: true,
            )
          ],
        ),
      ),
    );
  }
}
