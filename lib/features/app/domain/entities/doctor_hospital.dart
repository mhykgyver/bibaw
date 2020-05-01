import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class DoctorHospital extends Equatable {
  final String doctorID;
  final String hospitalID;
  final String consultationDaysHours; //e.g. M10-12/M14-16
  final String contactNo;
  final String roomNo;

  const DoctorHospital({
    @required this.doctorID,
    @required this.hospitalID,
    @required this.consultationDaysHours,
    @required this.contactNo,
    @required this.roomNo,
  });

  @override
  List<Object> get props => [
        doctorID,
        hospitalID,
        consultationDaysHours,
        contactNo,
        roomNo,
      ];
}
