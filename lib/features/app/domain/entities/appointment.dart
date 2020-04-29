import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Appointment extends Equatable {
  final DateTime _date;
  final String _appointmentID;
  final String _description;
  final String _doctorID;
  final String _hospitalID;
  final String _infantID;

  const Appointment({
    @required appointmentID,
    @required date,
    description,
    @required doctorID,
    @required hospitalID,
    @required infantID,
  })  : _appointmentID = appointmentID,
        _date = date,
        _description = description,
        _doctorID = doctorID,
        _hospitalID = hospitalID,
        _infantID = infantID;

  @override
  List<Object> get props => [
        _appointmentID,
        _date,
        _description,
        _doctorID,
        _hospitalID,
        _infantID,
      ];
}
