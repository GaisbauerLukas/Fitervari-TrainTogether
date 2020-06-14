import 'package:fitervari/contracts/customer.dart';
import 'package:fitervari/logic/helper/SessionInfo.dart';
import 'package:fitervari/views/profile_page/sub_widgets/profile_image.dart';
import 'package:fitervari/views/profile_page/sub_widgets/profile_information_box.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Customer currentCustomer;

  ProfilePage(this.currentCustomer);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProfileImage(currentCustomer.imageUrl),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                currentCustomer.name,
                style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.height -
                            SessionInfo().actionBarHeight) *
                        0.04),
              ),
            ),
            ProfileInformationBox(currentCustomer)
          ],
        ),
      ),
    );
  }
}
