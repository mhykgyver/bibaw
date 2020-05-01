import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Doctor extends Equatable {
  final String doctorID;
  final String firstName;
  final String lastName;
  final String middleInitial;
  final String practice;

  const Doctor({
    @required this.doctorID,
    @required this.firstName,
    @required this.lastName,
    this.middleInitial,
    @required this.practice,
  });

  @override
  List<Object> get props => [
        doctorID,
        firstName,
        lastName,
        middleInitial,
        practice,
      ];
}
