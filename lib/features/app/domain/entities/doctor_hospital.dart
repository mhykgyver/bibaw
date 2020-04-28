import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class DoctorHospital extends Equatable {
  final String _doctorID;
  final String _hospitalID;
  final String _consultationDaysHours; //e.g. M10-12/M14-16
  final String _contactNo;

  const DoctorHospital({
    @required doctorID,
    @required hospitalID,
    @required consultationDaysHours,
    @required contactNo,
  })  : _doctorID = doctorID,
        _hospitalID = hospitalID,
        _consultationDaysHours = consultationDaysHours,
        _contactNo = contactNo;

  @override
  List<Object> get props => [
        _doctorID,
        _hospitalID,
        _consultationDaysHours,
        _contactNo,
      ];
}
