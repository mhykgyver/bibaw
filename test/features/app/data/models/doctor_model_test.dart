import 'dart:convert';

import 'package:bibaw_app/features/app/data/models/doctor_model.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final _tDoctorModel = DoctorModel(
    doctorID: kDoctorID,
    firstName: 'Doctor',
    lastName: 'Who',
    middleInitial: 'X',
    practice: 'Pediatrician',
  );

  group('DoctorModel tests: ', () {
    test('should be a subclass of Doctor', () async {
      expect(_tDoctorModel, isA<Doctor>());
    });
    test('should return valid DoctorModel model', () async {
      // arrange
      final Map<String, dynamic> _jsonMap = json.decode(fixture('doctor.json'));
      print(_jsonMap);
      // act
      final _result = DoctorModel.fromJson(_jsonMap);
      // assert
      expect(_result, _tDoctorModel);
    });

    test('should return a JSON map containing proper data', () async {
      final _result = _tDoctorModel.toJson();
      final _jsonMap = {
        "doctorID": kDoctorID,
        "firstName": 'Doctor',
        "lastName": 'Who',
        "middleInitial": 'X',
        "practice": 'Pediatrician',
      };
      expect(_result, _jsonMap);
    });
  });
}
