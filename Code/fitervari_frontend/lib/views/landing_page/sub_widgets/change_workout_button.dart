import 'package:flutter/material.dart';

class ChangeWorkoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          margin: EdgeInsets.all(20),
          height: 30,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Anderes Workout',
                style: TextStyle(fontSize: 30, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
