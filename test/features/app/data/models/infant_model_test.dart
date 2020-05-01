import 'dart:convert';

import 'package:bibaw_app/features/app/data/models/infant_model.dart';
import 'package:bibaw_app/features/app/domain/entities/infant.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final _tInfantModel = InfantModel(
    infantID: kInfantID,
    firstName: 'Baby',
    lastName: 'Girl',
    middleInitial: 'G',
    gender: 'F',
    birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
    birthPlace: 'Test Birth Place',
    weight: 33.0,
    height: 80.0,
    circumferenceHead: 20.0,
    circumferenceChest: 25.0,
    circumferenceAbdominal: 22.0,
    scoreAPGAR: '9,9',
    birthProblems: 'test problems',
    distinguishingMarks: 'test marks',
    deliveryType: 'CS',
    parentID: kParentID,
    obstetricianID: kDoctorID,
    pediatricianID: kDoctorID,
    hospitalID: kInfantID,
  );

  group('InfantModel tests: ', () {
    test('should be a subclass of Infant', () async {
      expect(_tInfantModel, isA<Infant>());
    });
    test('should return valid InfantModel model', () async {
      // arrange
      final Map<String, dynamic> _jsonMap = json.decode(fixture('infant.json'));
      // act
      final _result = InfantModel.fromJson(_jsonMap);
      // assert
      expect(_result, _tInfantModel);
    });

    test('should return a JSON map containing proper data', () async {
      final _result = _tInfantModel.toJson();
      final _jsonMap = {
        'infantID': '$kInfantID',
        'firstName': 'Baby',
        'lastName': 'Girl',
        'middleInitial': 'G',
        'gender': 'F',
        'birthDate': DateTime.parse("2017-12-05 20:18:04Z"),
        'birthPlace': 'Test Birth Place',
        'weight': 33.0,
        'height': 80.0,
        'circumferenceHead': 20.0,
        'circumferenceChest': 25.0,
        'circumferenceAbdominal': 22.0,
        'scoreAPGAR': '9,9',
        'birthProblems': 'test problems',
        'distinguishingMarks': 'test marks',
        'deliveryType': 'CS',
        'parentID': '$kParentID',
        'obstetricianID': '$kDoctorID',
        'pediatricianID': '$kDoctorID',
        'hospitalID': '$kInfantID',
      };
      expect(_result, _jsonMap);
    });
  });
}
