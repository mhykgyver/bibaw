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
}
