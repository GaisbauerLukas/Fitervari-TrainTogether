import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/views/profile_page/sub_widgets/profile_image.dart';
import 'package:fitervari/views/profile_page/sub_widgets/profile_information_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, customerProvider, child) {
        var currentCustomer = customerProvider.getCurrentCustomer();
        return Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // later the image should be from the customer class
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    currentCustomer.name,
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.height -
                                SessionInfo().actionBarHeight) *
                            0.04),
                  ),
                ),
                Divider(),
                ProfileInformationBox(currentCustomer)
              ],
            ),
        );
      },
    );
  }
}
