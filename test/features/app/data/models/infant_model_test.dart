import 'package:bibaw_app/features/app/data/models/infant_model.dart';
import 'package:bibaw_app/features/app/domain/entities/infant.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';

void main() {
  final _tInfantModel = InfantModel(
      infantID: kInfantID,
      firstName: 'Baby',
      lastName: 'Girl',
      gender: 'F',
      height: 70.0,
      weight: 20.0,
      birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
      circumferenceHead: 33.1,
      parentID: kParentID);

  test('should be a subclass of Infant', () async {
    expect(_tInfantModel, isA<Infant>());
  });
}
