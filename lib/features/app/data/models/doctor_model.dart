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
}
