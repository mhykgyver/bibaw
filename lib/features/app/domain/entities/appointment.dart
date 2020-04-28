import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Appointment extends Equatable {
  final String _infantID;
  final String _doctorID;
  final String _hospitalID;
  final String _appointmentID;
  final DateTime _date;
  final String _description;

  const Appointment({
    @required infantID,
    @required doctorID,
    @required hospitalID,
    @required appointmentID,
    @required date,
    @required description,
  })  : _infantID = infantID,
        _doctorID = doctorID,
        _hospitalID = hospitalID,
        _appointmentID = appointmentID,
        _date = date,
        _description = description;

  @override
  List<Object> get props =>
      [_infantID, _doctorID, _hospitalID, _appointmentID, _date, _description];
}
