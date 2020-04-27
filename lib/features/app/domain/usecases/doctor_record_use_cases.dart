import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/doctor.dart';
import '../repositories/bibaw_repository.dart';

class AddDoctorRecord extends UseCase {
  final BibawRepository _repository;

  AddDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addDoctorRecord();
  }
}

class EditDoctorRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  EditDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editDoctorRecord(doctorID: params.doctorID);
  }
}

class DeleteDoctorRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  DeleteDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteDoctorRecord(doctorID: params.doctorID);
  }
}

class RetrieveDoctorRecord extends UseCase<Doctor, Params> {
  final BibawRepository _repository;

  RetrieveDoctorRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Doctor>> call(Params params) async {
    return await _repository.retrieveDoctorRecord(doctorID: params.doctorID);
  }
}

class Params extends Equatable {
  final String doctorID;

  const Params({@required this.doctorID});

  @override
  List<Object> get props => [doctorID];
}
