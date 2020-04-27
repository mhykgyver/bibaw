import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Infant extends Equatable {
  final String infantID;
  final String firstName;
  final String lastName;
  final String middleInitial;
  final String gender;
  final DateTime birthDate;
  final String birthPlace;
  final double weight;
  final double height;
  final double circumferenceHead;
  final double circumferenceChest;
  final double circumferenceAbdominal;
  final String scoreAPGAR;
  final String birthProblems;
  final String distinguishingMarks;
  final String deliveryType;
  final String parentID;
  final String obstetricianID;
  final String pediatricianID;
  final String hospitalID;

  const Infant({
    @required this.infantID,
    @required this.firstName,
    @required this.lastName,
    this.middleInitial,
    @required this.gender,
    @required this.birthDate,
    this.birthPlace,
    @required this.weight,
    @required this.height,
    @required this.circumferenceHead,
    this.circumferenceChest,
    this.circumferenceAbdominal,
    this.scoreAPGAR,
    this.birthProblems,
    this.distinguishingMarks,
    this.deliveryType,
    @required this.parentID,
    this.obstetricianID,
    this.pediatricianID,
    this.hospitalID,
  });

  @override
  List<Object> get props => [
        infantID,
        firstName,
        lastName,
        middleInitial,
        gender,
        birthDate,
        birthPlace,
        weight,
        height,
        circumferenceHead,
        circumferenceChest,
        circumferenceAbdominal,
        scoreAPGAR,
        birthProblems,
        distinguishingMarks,
        deliveryType,
        parentID,
        obstetricianID,
        pediatricianID,
        hospitalID,
      ];
}
