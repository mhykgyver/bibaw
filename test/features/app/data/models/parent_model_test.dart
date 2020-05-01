import 'dart:convert';

import 'package:bibaw_app/features/app/data/models/parent_model.dart';
import 'package:bibaw_app/features/app/domain/entities/parent.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final _tParentModel = ParentModel(
    parentID: kParentID,
    birthDate: DateTime.parse("1983-10-29 20:18:04.000Z"),
    firstName: 'Mommy',
    gender: 'F',
    lastName: 'Parent',
    middleInitial: 'P',
  );

  group('ParentModel tests: ', () {
    test('should be a subclass of Parent', () async {
      expect(_tParentModel, isA<Parent>());
    });
    test('should return valid ParentModel model', () async {
      // arrange
      final Map<String, dynamic> _jsonMap = json.decode(fixture('parent.json'));
      // act
      final _result = ParentModel.fromJson(_jsonMap);
      // assert
      expect(_result, _tParentModel);
    });

    test('should return a JSON map containing proper data', () async {
      final _result = _tParentModel.toJson();
      final _jsonMap = {
        "parentID": "$kParentID",
        "birthDate": "1983-10-29 20:18:04.000Z",
        "firstName": "Mommy",
        "gender": "F",
        "lastName": "Parent",
        "middleInitial": "P"
      };
      expect(_result, _jsonMap);
    });
  });
}
