import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:flutter/material.dart';

import '../../views/configuration_page/configuration_page.dart';
import '../../views/landing_page/landing_page.dart';
import '../../views/profile_page/profile_page.dart';
import '../../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs_screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    ConfigureationPage(),
    LandingPage(),
    ProfilePage(),
  ];

  List<AppBar> _appBars = [];
  AppBar _mainAppBar;

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this._mainAppBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
    );
    this._appBars = [
      this._mainAppBar,
      this._mainAppBar,
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(FillerPage.routeName),
            icon: Icon(Icons.edit),
            color: Colors.black,
          )
        ],
      )
    ];

    final bottomNavigationBar = BottomNavigationBar(
      unselectedItemColor: Colors.white70,
      selectedItemColor: Colors.white,
      currentIndex: _selectedPageIndex,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart),
          title: Text('Statistics'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('Profile'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ],
      onTap: _selectPage,
    );

    SessionInfo().actionBarHeight =
        _appBars[_selectedPageIndex].preferredSize.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      appBar: _appBars[_selectedPageIndex],
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
