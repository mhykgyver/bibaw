import 'package:bibaw_app/features/app/domain/entities/hospital.dart';
import 'package:flutter/widgets.dart';

class HospitalModel extends Hospital {
  const HospitalModel({
    @required hospitalID,
    @required name,
    @required location,
    @required contactNo,
  }) : super(
          hospitalID: hospitalID,
          name: name,
          location: location,
          contactNo: contactNo,
        );

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      contactNo: json['contactNo'],
      hospitalID: json['hospitalID'],
      location: json['location'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contactNo': contactNo,
      'hospitalID': hospitalID,
      'location': location,
      'name': name,
    };
  }
}
