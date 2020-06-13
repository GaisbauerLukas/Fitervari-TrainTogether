import 'package:fitervari/views/profile_page/sub_widgets/profile_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfileImage(
                'https://img.fotocommunity.com/sonnenuntergang-auf-samos-very-nice-6c68e562-a8b9-4dcd-b3dc-52667420f301.jpg?height=1080'),
            Text('asdfaskdfjpoasdnfosajdf')
          ],
        ),
      ),
    );
  }
}
