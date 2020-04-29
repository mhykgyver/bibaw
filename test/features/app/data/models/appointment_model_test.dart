import 'package:bibaw_app/features/app/data/models/appointment_model.dart';
import 'package:bibaw_app/features/app/domain/entities/appointment.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';

void main() {
  final _tAppointmentModel = AppointmentModel(
    appointmentID: kAppointmentID,
    date: DateTime.parse("2020-12-05 20:18:04Z"),
    description: "test description",
    doctorID: kDoctorID,
    hospitalID: kHospitalID,
    infantID: kInfantID,
  );

  test('should be a subclass of Appointment', () async {
    expect(_tAppointmentModel, isA<Appointment>());
  });
}
