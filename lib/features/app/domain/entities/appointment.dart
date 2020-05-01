import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Appointment extends Equatable {
  final DateTime date;
  final String appointmentID;
  final String description;
  final String doctorID;
  final String hospitalID;
  final String infantID;

  const Appointment({
    @required this.appointmentID,
    @required this.date,
    this.description,
    @required this.doctorID,
    @required this.hospitalID,
    @required this.infantID,
  });

  @override
  List<Object> get props => [
        appointmentID,
        date,
        description,
        doctorID,
        hospitalID,
        infantID,
      ];
}
