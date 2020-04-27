import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Checkup extends Equatable {
  final String checkupID;
  final DateTime date;
  final double weight;
  final double height;
  final double circumferenceHead;
  final String problems;
  final String medication;
  final String instructions;

  const Checkup({
    @required this.checkupID,
    @required this.date,
    @required this.weight,
    @required this.height,
    @required this.circumferenceHead,
    @required this.problems,
    @required this.medication,
    @required this.instructions,
  });

  @override
  List<Object> get props => [
        checkupID,
        date,
        weight,
        height,
        circumferenceHead,
        problems,
        medication,
        instructions,
      ];
}
