import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FillerPage extends StatelessWidget {
  static const routeName = '/filler';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              child: Image.network(
                'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.12,
              right: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.width * 0.1,
              child: ClipRRect(
                child: Container(
                  height: (MediaQuery.of(context).size.height - SessionInfo().actionBarHeight) * 0.75,
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'This feature will soon be ready for you',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.w100
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
