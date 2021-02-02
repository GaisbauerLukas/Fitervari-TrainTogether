import 'package:fitervari/contracts/transfer/workout.dart';
import 'package:fitervari/logic/helper/session_info.dart';
import 'package:fitervari/logic/providers/customer_provider.dart';
import 'package:fitervari/views/create_workout_page/create_workout_page.dart';
import 'package:fitervari/views/landing_page/sub_widgets/choose_workout_bottom_sheet.dart';
import 'package:fitervari/views/workout_edit_view/workout_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateWorkoutButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateWorkoutButtonState();

}

class CreateWorkoutButtonState extends State<CreateWorkoutButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
        builder: (context, customerProvider, child) {
          var customer = customerProvider.getCurrentCustomer();
      return InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(
                WorkoutEditView.routeName, 
                arguments: new Workout(id: null, name: "", creationDate: DateTime.now(), creator: customer, officialFlag: false, exercises: [], workoutHistories: [])
        ),
        child: Card(
          margin: EdgeInsets.all(10),
          color: Theme.of(context).primaryColor,
          elevation: 4,
          child: Container(
            margin: EdgeInsets.all(20),
            height: (MediaQuery.of(context).size.height -
                    SessionInfo().actionBarHeight) *
                0.04,
            width: double.infinity,
            child: Center(
              child: Text(
                'Neues Workout erstellen',
                style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.height -
                            SessionInfo().actionBarHeight) *
                        0.04,
                    color: Colors.white,
                    fontWeight: FontWeight.w100),
              ),
            ),
          ),
        ),
      );
    });
  }
}
