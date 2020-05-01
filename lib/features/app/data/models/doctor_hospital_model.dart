import 'package:bibaw_app/features/app/domain/entities/doctor_hospital.dart';
import 'package:flutter/widgets.dart';

class DoctorHospitalModel extends DoctorHospital {
  const DoctorHospitalModel({
    @required doctorID,
    @required hospitalID,
    @required consultationDaysHours,
    @required contactNo,
    @required roomNo,
  }) : super(
          doctorID: doctorID,
          hospitalID: hospitalID,
          consultationDaysHours: consultationDaysHours,
          contactNo: contactNo,
          roomNo: roomNo,
        );
  factory DoctorHospitalModel.fromJson(Map<String, dynamic> json) {
    return DoctorHospitalModel(
      doctorID: json['doctorID'],
      hospitalID: json['hospitalID'],
      consultationDaysHours: json['consultationDaysHours'],
      contactNo: json['contactNo'],
      roomNo: json['roomNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorID': doctorID,
      'hospitalID': hospitalID,
      'consultationDaysHours': consultationDaysHours,
      'contactNo': contactNo,
      'roomNo': roomNo,
    };
  }
}
