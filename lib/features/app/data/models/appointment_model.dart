import 'package:bibaw_app/features/app/domain/entities/appointment.dart';
import 'package:flutter/widgets.dart';

class AppointmentModel extends Appointment {
  const AppointmentModel({
    @required appointmentID,
    @required date,
    description,
    @required doctorID,
    @required hospitalID,
    @required infantID,
  }) : super(
          appointmentID: appointmentID,
          date: date,
          description: description,
          doctorID: doctorID,
          hospitalID: hospitalID,
          infantID: infantID,
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        appointmentID: json['appointmentID'],
        date: DateTime.parse(json['date']),
        doctorID: json['doctorID'],
        hospitalID: json['hospitalID'],
        infantID: json['infantID'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'appointmentID': appointmentID,
      'date': date.toString(),
      'description': description,
      'doctorID': doctorID,
      'hospitalID': hospitalID,
      'infantID': infantID,
    };
  }
}
