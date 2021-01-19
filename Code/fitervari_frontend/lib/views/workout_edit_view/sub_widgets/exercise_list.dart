import 'package:fitervari/logic/providers/exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseList extends StatelessWidget {
  static const routeName = "/Exercise_List";

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(),
        );
      },
    );
  }
}
