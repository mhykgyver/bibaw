import 'package:bibaw_app/features/app/data/models/doctor_model.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';

void main() {
  final _tDoctorModel = DoctorModel(
    doctorID: kDoctorID,
    firstName: 'Doctor',
    lastName: 'Who',
    middleInitial: 'X',
    practice: 'Pediatrician',
  );

  test('should be a subclass of Doctor', () async {
    expect(_tDoctorModel, isA<Doctor>());
  });
}
