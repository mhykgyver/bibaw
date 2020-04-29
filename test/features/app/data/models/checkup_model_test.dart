import 'package:bibaw_app/features/app/data/models/checkup_model.dart';
import 'package:bibaw_app/features/app/domain/entities/checkup.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/constants.dart';

void main() {
  final _tCheckupModel = CheckupModel(
    checkupID: kCheckupID,
    circumferenceHead: 33.0,
    date: DateTime.parse("2020-12-05 20:18:04Z"),
    height: 80.0,
    instructions: 'test instructions',
    medication: 'test medications',
    problems: 'test problems',
    weight: 30.0,
  );

  test('should be a subclass of Checkup', () async {
    expect(_tCheckupModel, isA<Checkup>());
  });
}
