import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Checkup extends Equatable {
  final String _checkupID;
  final DateTime _date;
  final double _weight;
  final double _height;
  final double _circumferenceHead;
  final String _problems;
  final String _medication;
  final String _instructions;

  const Checkup({
    @required checkupID,
    @required date,
    @required weight,
    @required height,
    @required circumferenceHead,
    @required problems,
    @required medication,
    @required instructions,
  })  : _checkupID = checkupID,
        _date = date,
        _weight = weight,
        _height = height,
        _circumferenceHead = circumferenceHead,
        _problems = problems,
        _medication = medication,
        _instructions = instructions;

  @override
  List<Object> get props => [
        _checkupID,
        _date,
        _weight,
        _height,
        _circumferenceHead,
        _problems,
        _medication,
        _instructions,
      ];
}
