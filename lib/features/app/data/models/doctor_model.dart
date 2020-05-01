import 'package:bibaw_app/features/app/domain/entities/doctor.dart';
import 'package:flutter/widgets.dart';

class DoctorModel extends Doctor {
  const DoctorModel({
    @required doctorID,
    @required firstName,
    @required lastName,
    middleInitial,
    @required practice,
  }) : super(
          doctorID: doctorID,
          firstName: firstName,
          lastName: lastName,
          middleInitial: middleInitial,
          practice: practice,
        );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorID: json['doctorID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleInitial: json['middleInitial'],
      practice: json['practice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorID': doctorID,
      'firstName': firstName,
      'lastName': lastName,
      'middleInitial': middleInitial,
      'practice': practice,
    };
  }
}
