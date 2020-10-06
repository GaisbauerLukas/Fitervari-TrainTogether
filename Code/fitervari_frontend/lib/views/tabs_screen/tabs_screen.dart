import 'package:fitervari/contracts/customer.dart';
import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:flutter/material.dart';

import '../../widgets/main_drawer.dart';
import '../../views/configuration_page/configuration_page.dart';
import '../../views/landing_page/landing_page.dart';
import '../../views/profile_page/profile_page.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    ConfigureationPage(),
    LandingPage(),
    ProfilePage(
      Customer(
        id: -1,
        imageUrl: 'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
        cashCustomer: true,
        joinDate: DateTime.utc(2019,5,12),
        memberTill: DateTime.utc(2021, 5,12),
        name: 'Florian Müller',
        trainerId: 2
      )
    ),
  ];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
      backgroundColor: Colors.white,
    );

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

    SessionInfo().actionBarHeight = appBar.preferredSize.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      appBar: appBar,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
