import 'package:fitervari/views/landing_page/sub_widgets/info_item.dart';
import 'package:fitervari/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Hi'),),
      body: Column(
        children: <Widget>[
          InfoItem()
        ],
      )
    );
  }
}
