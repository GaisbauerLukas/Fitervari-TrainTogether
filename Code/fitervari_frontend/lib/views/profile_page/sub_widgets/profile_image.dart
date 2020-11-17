import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;

  ProfileImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    double picScaling = 0.29;

    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: (MediaQuery.of(context).size.height -
                      SessionInfo().actionBarHeight) *
                  picScaling,
              height: (MediaQuery.of(context).size.height -
                      SessionInfo().actionBarHeight) *
                  picScaling,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                //TODO add on click open a page to select another picture
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
