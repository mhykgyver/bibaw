import 'package:bibaw_app/features/app/data/models/hospital_model.dart';
import 'package:bibaw_app/features/app/domain/entities/hospital.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';

void main() {
  final _tHospitalModel = HospitalModel(
    contactNo: '1234567',
    hospitalID: kHospitalID,
    location: 'test location',
    name: 'Test Hospital',
  );

  test('should be a subclass of Hospital', () async {
    expect(_tHospitalModel, isA<Hospital>());
  });
}
