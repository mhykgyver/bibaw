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
}
