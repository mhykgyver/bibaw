import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Parent extends Equatable {
  final String parentID;
  final String firstName;
  final String lastName;
  final String middleInitial;
  final DateTime birthDate;
  final String gender;

  const Parent({
    @required this.parentID,
    @required this.firstName,
    @required this.lastName,
    this.middleInitial,
    @required this.birthDate,
    this.gender,
  });

  @override
  List<Object> get props => [
        birthDate,
        firstName,
        gender,
        lastName,
        middleInitial,
        parentID,
      ];
}
