import 'package:fitervari/views/landing_page/sub_widgets/change_workout_button.dart';
import 'package:flutter/material.dart';

import './sub_widgets/info_item.dart';
import './sub_widgets/start_workout_button.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //TODO this should be dynamic and from called from the server
        Container(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              InfoItem('Alles neu',
                  'https://worldofmusicfans.com/wp-content/uploads/2019/09/Movin-On.jpg'),
              InfoItem('So wie noch nie',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgb50TR36ss8UrHOm16NibmN4XijJEmf3WOjNibGB1ab1DDR7g&usqp=CAU'),
            ],
          ),
        ),
        Container(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[InfoItem('Dein Fortschritt',
                'https://produzizivot.com/wp-content/uploads/2020/03/Best-NCS-Workout-Songs-Mix-Bodybuilding-Motivation-NoCopyrightSounds-Mali-Doca-3.png'), InfoItem('Mach dich bereit',
                'https://secureservercdn.net/184.168.47.225/4b4.026.myftpupload.com/wp-content/uploads/2013/12/HeaderBG1.jpg')],
          ),
        ),
        StartWorkoutButton(),
        ChangeWorkoutButton()
      ],
    );
  }
}
