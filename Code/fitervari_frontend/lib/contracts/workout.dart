
import 'package:fitervari/contracts/identifiable.dart';
import 'package:flutter/cupertino.dart';

class Workout extends Identifiable{

  final String name;
  final DateTime creationDate;
  final int creatorId;
  final bool officialFlag;
  //final List<Exercise> listOfExercises;

  const Workout({
    @required int id,
    @required this.name,
    @required this.creationDate,
    @required this.creatorId,
    @required this.officialFlag
  }) : super(id);

}
