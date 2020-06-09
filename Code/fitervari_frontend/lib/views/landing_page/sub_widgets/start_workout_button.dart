import 'package:fitervari/logic/helper/SessionInfo.dart';
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
          height: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.17,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Start',
                style: TextStyle(fontSize: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.09, color: Colors.white, fontWeight: FontWeight.w100),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                width: double.infinity,
                height: 1,
              ),
              Text(
                'TestWorkout',
                style: TextStyle(fontSize: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.025, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
