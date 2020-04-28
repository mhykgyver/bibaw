import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/doctor.dart';
import '../repositories/bibaw_repository.dart';

class AddDoctorRecord extends UseCase {
  final IBibawRepository _repository;

  AddDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addDoctorRecord();
  }
}

class EditDoctorRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editDoctorRecord(doctorID: params._doctorID);
  }
}

class DeleteDoctorRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteDoctorRecord(doctorID: params._doctorID);
  }
}

class RetrieveDoctorRecord extends UseCase<Doctor, Params> {
  final IBibawRepository _repository;

  RetrieveDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Doctor>> call(Params params) async {
    return await _repository.retrieveDoctorRecord(doctorID: params._doctorID);
  }
}

class Params extends Equatable {
  final String _doctorID;

  const Params({@required doctorID}) : _doctorID = doctorID;

  @override
  List<Object> get props => [_doctorID];
}
