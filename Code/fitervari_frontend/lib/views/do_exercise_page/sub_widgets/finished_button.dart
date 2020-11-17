import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinishedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Card(
        margin: EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          margin: EdgeInsets.all(20),
          height: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.15,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Erledigt',
                style: TextStyle(fontSize: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.09, color: Colors.white, fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
      ),
    );
  }

}