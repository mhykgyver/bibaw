import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Parent extends Equatable {
  final String _parentID;
  final String _firstName;
  final String _lastName;
  final String _middleInitial;
  final DateTime _birthDate;
  final String _gender;

  const Parent({
    @required parentID,
    @required firstName,
    @required lastName,
    middleInitial,
    @required birthDate,
    gender,
  })  : _parentID = parentID,
        _firstName = firstName,
        _lastName = lastName,
        _middleInitial = middleInitial,
        _birthDate = birthDate,
        _gender = gender;

  @override
  List<Object> get props => [
        _birthDate,
        _firstName,
        _gender,
        _lastName,
        _middleInitial,
        _parentID,
      ];
}
