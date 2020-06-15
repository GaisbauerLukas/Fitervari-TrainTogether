import 'package:flutter/material.dart';

import '../views/filler_page/filler_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function action) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Colors.black,),
      ),
      onTap: action,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildListTile('Options', Icons.settings,
                () => Navigator.of(context).pushNamed(FillerPage.routeName)),
            //TODO find a better solution for spaces
            SizedBox(
              height: 20,
            ),
            buildListTile('About Fitervari', Icons.info,
                () => Navigator.of(context).pushNamed(FillerPage.routeName)),
            SizedBox(
              height: 20,
            ),
            buildListTile('Logout', Icons.arrow_back,
                () => Navigator.of(context).pushNamed(FillerPage.routeName)),
          ],
        ),
      ),
    );
  }
}
