import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:flutter/material.dart';

class StartWorkoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FillerPage.routeName),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          margin: EdgeInsets.all(20),
          height: 100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Start',
                style: TextStyle(fontSize: 55, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                width: double.infinity,
                height: 1,
              ),
              Text(
                'TestWorkout',
                style: TextStyle(fontSize: 20, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
