import 'package:fitervari/contracts/transfer/customer.dart';
import 'package:fitervari/logic/helper/session_info.dart';
import 'package:flutter/material.dart';

class ProfileInformationBox extends StatelessWidget {
  final Customer currentCustomer;

  ProfileInformationBox(this.currentCustomer);

  @override
  Widget build(BuildContext context) {
    var textSize = 15.0;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(15),
          height: (MediaQuery.of(context).size.height -
                  SessionInfo().actionBarHeight) *
              0.35,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              ListTile(
                dense: true,
                leading: Icon(Icons.calendar_today),
                title: Text('Mitglied seit:'),
                trailing: Text(
                  '${currentCustomer.joinDate.day}'
                  '.${currentCustomer.joinDate.month}'
                  '.${currentCustomer.joinDate.year}',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.exit_to_app),
                title: Text('Mitglied bis:'),
                trailing: Text(
                  '${currentCustomer.memberTill.day}'
                  '.${currentCustomer.memberTill.month}'
                  '.${currentCustomer.memberTill.year}',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.monetization_on),
                title: Text('Bezahlungsart'),
                trailing: Text(
                  currentCustomer.cashCustomer ? 'Bar' : 'Bankverbindung',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
