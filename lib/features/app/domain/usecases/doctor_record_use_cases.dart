import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/doctor.dart';
import '../repositories/bibaw_repository.dart';

class AddDoctorRecord extends IUseCase<bool, Params> {
  final IBibawRepository _repository;

  AddDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.addDoctorRecord(
        doctorID: params._doctorID,
        firstName: params._firstName,
        lastName: params._lastName,
        middleInitial: params._middleInitial,
        practice: params._practice);
  }
}

class EditDoctorRecord extends IUseCase<bool, Params> {
  final IBibawRepository _repository;

  EditDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.editDoctorRecord(
      doctorID: params._doctorID,
      firstName: params._firstName,
      lastName: params._lastName,
      middleInitial: params._middleInitial,
      practice: params._practice,
    );
  }
}

class DeleteDoctorRecord extends IUseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.deleteDoctorRecord(doctorID: params._doctorID);
  }
}

class RetrieveDoctorRecord extends IUseCase<Doctor, Params> {
  final IBibawRepository _repository;

  RetrieveDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, Doctor>> call(Params params) async {
    return await _repository.retrieveDoctorRecord(doctorID: params._doctorID);
  }
}

class Params extends Equatable {
  final String _doctorID;
  final String _firstName;
  final String _lastName;
  final String _middleInitial;
  final String _practice;

  const Params({
    @required doctorID,
    firstName,
    lastName,
    middleInitial,
    practice,
  })  : _doctorID = doctorID,
        _firstName = firstName,
        _lastName = lastName,
        _middleInitial = middleInitial,
        _practice = practice;

  @override
  List<Object> get props => [
        _doctorID,
        _firstName,
        _lastName,
        _middleInitial,
        _practice,
      ];
}
