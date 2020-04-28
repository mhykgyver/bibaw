import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Doctor extends Equatable {
  final String _doctorID;
  final String _firstName;
  final String _lastName;
  final String _middleInitial;
  final String _practice;

  const Doctor({
    @required doctorID,
    @required firstName,
    @required lastName,
    middleInitial,
    @required practice,
  })  : _doctorID = doctorID,
        _firstName = firstName,
        _lastName = lastName,
        _middleInitial = middleInitial,
        _practice = practice;

  @override
  List<Object> get props => [
        _doctorID,
        _firstName,
        _lastName,
        _middleInitial,
        _practice,
      ];
}
