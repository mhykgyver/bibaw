import 'package:bibaw_app/features/app/domain/entities/checkup.dart';
import 'package:flutter/widgets.dart';

class CheckupModel extends Checkup {
  const CheckupModel({
    @required checkupID,
    @required circumferenceHead,
    @required date,
    @required height,
    @required instructions,
    @required medication,
    @required problems,
    @required weight,
  }) : super(
          checkupID: checkupID,
          circumferenceHead: circumferenceHead,
          date: date,
          height: height,
          instructions: instructions,
          medication: medication,
          problems: problems,
          weight: weight,
        );
}
