import 'dart:convert';

import 'package:bibaw_app/features/app/data/models/hospital_model.dart';
import 'package:bibaw_app/features/app/domain/entities/hospital.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final _tHospitalModel = HospitalModel(
    contactNo: '1234567',
    hospitalID: kHospitalID,
    location: 'test location',
    name: 'Test Hospital',
  );

  group('HospitalModel tests: ', () {
    test('should be a subclass of Hospital', () async {
      expect(_tHospitalModel, isA<Hospital>());
    });

    test('should return valid HospitalModel model', () async {
      // arrange
      final Map<String, dynamic> _jsonMap =
          json.decode(fixture('hospital.json'));
      print(_jsonMap);
      // act
      final _result = HospitalModel.fromJson(_jsonMap);
      // assert
      expect(_result, _tHospitalModel);
    });

    test('should return a JSON map containing proper data', () async {
      final _result = _tHospitalModel.toJson();
      final _jsonMap = {
        "contactNo": "1234567",
        "hospitalID": "d9f268cd-a78f-438c-80bb-369053fdc870",
        "location": "test location",
        "name": "Test Hospital"
      };
      expect(_result, _jsonMap);
    });
  });
}
