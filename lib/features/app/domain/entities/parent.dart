import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Parent extends Equatable {
  final String parentID;
  final String firstName;
  final String lastName;
  final String middleInitial;
  final DateTime birthDate;

  const Parent({
    @required this.parentID,
    @required this.firstName,
    @required this.lastName,
    this.middleInitial,
    @required this.birthDate,
  });

  @override
  List<Object> get props => [
        parentID,
        firstName,
        lastName,
        middleInitial,
        birthDate,
      ];
}
