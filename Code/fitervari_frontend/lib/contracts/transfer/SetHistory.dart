import 'package:fitervari/contracts/identifiable.dart';

class SetHistory extends Identifiable {
  double time;
  double distance;
  double weight;
  int repetitions;
  int setNumber;

  SetHistory(
      {int id,
      this.time,
      this.distance,
      this.weight,
      this.repetitions,
      this.setNumber})
      : super(id);
}
