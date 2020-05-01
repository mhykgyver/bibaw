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
  factory CheckupModel.fromJson(Map<String, dynamic> json) {
    return CheckupModel(
      checkupID: json['checkupID'],
      date: DateTime.parse(json['date']),
      circumferenceHead: json['circumferenceHead'],
      height: json['height'],
      instructions: json['instructions'],
      medication: json['medication'],
      problems: json['problems'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'checkupID': checkupID,
      'date': date.toString(),
      'circumferenceHead': circumferenceHead,
      'height': height,
      'instructions': instructions,
      'medication': medication,
      'problems': problems,
      'weight': weight,
    };
  }
}
