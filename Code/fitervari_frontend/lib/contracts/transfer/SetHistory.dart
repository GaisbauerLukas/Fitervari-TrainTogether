import 'package:fitervari/contracts/identifiable.dart';
import 'package:flutter/cupertino.dart';

class SetHistory extends Identifiable {
  double time;
  double distance;
  double weight;
  int repetitions;
  int setNumber;

  SetHistory(
      {@required int id,
      @required this.time,
      @required this.distance,
      @required this.weight,
      @required this.repetitions,
      @required this.setNumber})
      : super(id);
}
