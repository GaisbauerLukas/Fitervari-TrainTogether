
import 'package:fitervari/contracts/identifiable.dart';

import 'SetHistory.dart';

class ExerciseHistory extends Identifiable {
  List<SetHistory> setHistories;

  ExerciseHistory(int id) : super(id);
}