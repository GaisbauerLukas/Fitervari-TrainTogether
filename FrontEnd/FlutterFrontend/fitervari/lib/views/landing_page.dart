import 'package:fitervari/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Hi'),),
      body: Center(
        child: Text("Works"),
      ),
    );
  }
}
