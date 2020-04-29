import 'package:bibaw_app/features/app/data/models/parent_model.dart';
import 'package:bibaw_app/features/app/domain/entities/parent.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';

void main() {
  final _tParentModel = ParentModel(
    parentID: kParentID,
    birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
    firstName: 'Mommy',
    gender: 'F',
    lastName: 'Parent',
    middleInitial: 'P',
  );

  test('should be a subclass of Parent', () async {
    expect(_tParentModel, isA<Parent>());
  });
}
