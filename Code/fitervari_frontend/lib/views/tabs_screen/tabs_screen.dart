import 'package:fitervari/contracts/customer.dart';
import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/configuration_page/configuration_page.dart';
import '../../views/landing_page/landing_page.dart';
import '../../views/profile_page/profile_page.dart';
import '../../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
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
    Provider.of<CustomerProvider>(context, listen: false).setCurrentCustomer(
        Customer(
            id: -1,
            imageUrl:
                'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
            cashCustomer: true,
            joinDate: DateTime.utc(2019, 5, 12),
            memberTill: DateTime.utc(2021, 5, 12),
            name: 'Florian Geht',
            trainerId: 2));
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
