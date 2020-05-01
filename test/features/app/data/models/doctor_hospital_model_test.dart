import 'dart:convert';

import 'package:bibaw_app/features/app/data/models/doctor_hospital_model.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor_hospital.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final _tDoctorHospitalModel = DoctorHospitalModel(
    doctorID: kDoctorID,
    hospitalID: kHospitalID,
    consultationDaysHours: "M10-12/M14-16",
    contactNo: '123456789',
    roomNo: '123',
  );

  group('DoctorHospitalModel tests: ', () {
    test('should be a subclass of DoctorHospital', () async {
      expect(_tDoctorHospitalModel, isA<DoctorHospital>());
    });
    test('should return valid DoctorHospitalModel model', () async {
      // arrange
      final Map<String, dynamic> _jsonMap =
          json.decode(fixture('doctor_hospital.json'));
      print(_jsonMap);
      // act
      final _result = DoctorHospitalModel.fromJson(_jsonMap);
      // assert
      expect(_result, _tDoctorHospitalModel);
    });

    test('should return a JSON map containing proper data', () async {
      final _result = _tDoctorHospitalModel.toJson();
      final _jsonMap = {
        "doctorID": "$kDoctorID",
        "hospitalID": "$kHospitalID",
        "consultationDaysHours": "M10-12/M14-16",
        "contactNo": "123456789",
        "roomNo": "123"
      };
      expect(_result, _jsonMap);
    });
  });
}
