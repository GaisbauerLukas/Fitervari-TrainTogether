import 'package:flutter/material.dart';

class MainAppbar extends AppBar {

  final GlobalKey<ScaffoldState> _scaffoldKey;

  MainAppbar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
    );
  }
}