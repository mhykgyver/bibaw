import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Infant extends Equatable {
  final String _infantID;
  final String _firstName;
  final String _lastName;
  final String _middleInitial;
  final String _gender;
  final DateTime _birthDate;
  final String _birthPlace;
  final double _weight;
  final double _height;
  final double _circumferenceHead;
  final double _circumferenceChest;
  final double _circumferenceAbdominal;
  final String _scoreAPGAR;
  final String _birthProblems;
  final String _distinguishingMarks;
  final String _deliveryType;
  final String _parentID;
  final String _obstetricianID;
  final String _pediatricianID;
  final String _hospitalID;

  const Infant({
    @required infantID,
    @required firstName,
    @required lastName,
    middleInitial,
    @required gender,
    @required birthDate,
    birthPlace,
    @required weight,
    @required height,
    @required circumferenceHead,
    circumferenceChest,
    circumferenceAbdominal,
    scoreAPGAR,
    birthProblems,
    distinguishingMarks,
    deliveryType,
    @required parentID,
    obstetricianID,
    pediatricianID,
    hospitalID,
  })  : _infantID = infantID,
        _firstName = firstName,
        _lastName = lastName,
        _middleInitial = middleInitial,
        _gender = gender,
        _birthDate = birthDate,
        _birthPlace = birthPlace,
        _weight = weight,
        _height = height,
        _circumferenceHead = circumferenceHead,
        _circumferenceChest = circumferenceChest,
        _circumferenceAbdominal = circumferenceAbdominal,
        _scoreAPGAR = scoreAPGAR,
        _birthProblems = birthProblems,
        _distinguishingMarks = distinguishingMarks,
        _deliveryType = deliveryType,
        _parentID = parentID,
        _obstetricianID = obstetricianID,
        _pediatricianID = pediatricianID,
        _hospitalID = hospitalID;

  @override
  List<Object> get props => [
        _infantID,
        _firstName,
        _lastName,
        _middleInitial,
        _gender,
        _birthDate,
        _birthPlace,
        _weight,
        _height,
        _circumferenceHead,
        _circumferenceChest,
        _circumferenceAbdominal,
        _scoreAPGAR,
        _birthProblems,
        _distinguishingMarks,
        _deliveryType,
        _parentID,
        _obstetricianID,
        _pediatricianID,
        _hospitalID,
      ];
}
