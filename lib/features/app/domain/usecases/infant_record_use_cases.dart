import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/infant.dart';
import '../repositories/bibaw_repository.dart';

class AddInfantRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  AddInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.addInfantRecord(
      infantID: params._infantID,
      firstName: params._firstName,
      lastName: params._lastName,
      middleInitial: params._middleInitial,
      gender: params._gender,
      birthDate: params._birthDate,
      birthPlace: params._birthPlace,
      weight: params._weight,
      height: params._height,
      circumferenceHead: params._circumferenceHead,
      circumferenceChest: params._circumferenceChest,
      circumferenceAbdominal: params._circumferenceAbdominal,
      scoreAPGAR: params._scoreAPGAR,
      birthProblems: params._birthProblems,
      distinguishingMarks: params._distinguishingMarks,
      deliveryType: params._deliveryType,
      parentID: params._parentID,
      obstetricianID: params._obstetricianID,
      pediatricianID: params._pediatricianID,
      hospitalID: params._hospitalID,
    );
  }
}

class EditInfantRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editInfantRecord(
      infantID: params._infantID,
      firstName: params._firstName,
      lastName: params._lastName,
      middleInitial: params._middleInitial,
      gender: params._gender,
      birthDate: params._birthDate,
      birthPlace: params._birthPlace,
      weight: params._weight,
      height: params._height,
      circumferenceHead: params._circumferenceHead,
      circumferenceChest: params._circumferenceChest,
      circumferenceAbdominal: params._circumferenceAbdominal,
      scoreAPGAR: params._scoreAPGAR,
      birthProblems: params._birthProblems,
      distinguishingMarks: params._distinguishingMarks,
      deliveryType: params._deliveryType,
      parentID: params._parentID,
      obstetricianID: params._obstetricianID,
      pediatricianID: params._pediatricianID,
      hospitalID: params._hospitalID,
    );
  }
}

class DeleteInfantRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteInfantRecord(infantID: params._infantID);
  }
}

class RetrieveInfantRecord extends UseCase<Infant, Params> {
  final IBibawRepository _repository;

  RetrieveInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Infant>> call(Params params) async {
    return await _repository.retrieveInfantRecord(infantID: params._infantID);
  }
}

class Params extends Equatable {
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

  const Params({
    @required infantID,
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
