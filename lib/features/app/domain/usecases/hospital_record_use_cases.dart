import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/hospital.dart';
import '../repositories/bibaw_repository.dart';

class AddHospitalRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  AddHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.addHospitalRecord(
      contactNo: params._contactNo,
      hospitalID: params._hospitalID,
      location: params._location,
      name: params._name,
    );
  }
}

class EditHospitalRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editHospitalRecord(
      contactNo: params._contactNo,
      hospitalID: params._hospitalID,
      location: params._location,
      name: params._name,
    );
  }
}

class DeleteHospitalRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteHospitalRecord(
        hospitalID: params._hospitalID);
  }
}

class RetrieveHospitalRecord extends UseCase<Hospital, Params> {
  final IBibawRepository _repository;

  RetrieveHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Hospital>> call(Params params) async {
    return await _repository.retrieveHospitalRecord(
        hospitalID: params._hospitalID);
  }
}

class Params extends Equatable {
  final String _hospitalID;
  final String _name;
  final String _location;
  final String _contactNo;

  const Params({
    @required hospitalID,
    name,
    location,
    contactNo,
  })  : _hospitalID = hospitalID,
        _name = name,
        _location = location,
        _contactNo = contactNo;

  @override
  List<Object> get props => [
        _hospitalID,
        _name,
        _location,
        _contactNo,
      ];
}
