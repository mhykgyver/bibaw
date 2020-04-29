import 'package:bibaw_app/features/app/data/models/doctor_hospital_model.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor_hospital.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';

void main() {
  final _tDoctorHospitalModel = DoctorHospitalModel(
    doctorID: kDoctorID,
    hospitalID: kHospitalID,
    consultationDaysHours: "M10-12/M14-16",
    contactNo: '123456789',
    roomNo: '123',
  );

  test('should be a subclass of DoctorHospital', () async {
    expect(_tDoctorHospitalModel, isA<DoctorHospital>());
  });
}
