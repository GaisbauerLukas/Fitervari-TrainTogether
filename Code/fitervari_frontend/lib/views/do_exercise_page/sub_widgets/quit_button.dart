import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(FillerPage.routeName),
      child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        shadowColor: Theme.of(context).errorColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          margin: EdgeInsets.all(20),
          height: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.053,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Abbrechen',
                style: TextStyle(fontSize: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.045, color: Theme.of(context).errorColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

}