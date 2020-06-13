import 'package:flutter/material.dart';

class general_info extends StatelessWidget {
  const general_info({
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
              'Allgemeine Info',
              textScaleFactor: 2,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Letztes Workout'),
              subtitle: Text('Rückenworkout'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Letzter Termin'),
              subtitle: Text('13.03.2020'),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Sven Müller'),
              subtitle: Text('13.03.2020'),
            )
          ],
        ),
      ),
    );
  }
}
