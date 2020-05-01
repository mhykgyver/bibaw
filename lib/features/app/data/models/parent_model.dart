import 'package:flutter/widgets.dart';

import '../../domain/entities/parent.dart';

class ParentModel extends Parent {
  const ParentModel({
    @required parentID,
    @required firstName,
    @required lastName,
    middleInitial,
    @required birthDate,
    gender,
  }) : super(
          parentID: parentID,
          firstName: firstName,
          lastName: lastName,
          middleInitial: middleInitial,
          birthDate: birthDate,
          gender: gender,
        );

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      parentID: json['parentID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleInitial: json['middleInitial'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parentID': parentID,
      'firstName': firstName,
      'lastName': lastName,
      'middleInitial': middleInitial,
      'birthDate': birthDate.toString(),
      'gender': gender,
    };
  }
}
