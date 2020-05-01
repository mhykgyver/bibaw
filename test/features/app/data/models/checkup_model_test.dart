import 'dart:convert';

import 'package:bibaw_app/features/app/data/models/checkup_model.dart';
import 'package:bibaw_app/features/app/domain/entities/checkup.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final _tCheckupModel = CheckupModel(
    checkupID: kCheckupID,
    circumferenceHead: 33.1,
    date: DateTime.parse("2020-12-05 20:18:04.000Z"),
    height: 70.0,
    instructions: 'instructions test',
    medication: 'medication notice',
    problems: 'problems test',
    weight: 20.0,
  );

  group('CheckupModel tests: ', () {
    test('should be a subclass of Checkup', () async {
      expect(_tCheckupModel, isA<Checkup>());
    });
    test('should return valid CheckupModel model', () async {
      // arrange
      final Map<String, dynamic> _jsonMap =
          json.decode(fixture('checkup.json'));
      print(_jsonMap);
      // act
      final _result = CheckupModel.fromJson(_jsonMap);
      print(_result.props);
      print(_tCheckupModel.props);
      // assert
      expect(_result, _tCheckupModel);
    });

    test('should return a JSON map containing proper data', () async {
      final _result = _tCheckupModel.toJson();
      final _jsonMap = {
        "checkupID": "$kCheckupID",
        "height": 70.0,
        "weight": 20.0,
        "date": "2020-12-05 20:18:04.000Z",
        "circumferenceHead": 33.1,
        "medication": "medication notice",
        "problems": "problems test",
        "instructions": "instructions test",
      };
      expect(_result, _jsonMap);
    });
  });
}
