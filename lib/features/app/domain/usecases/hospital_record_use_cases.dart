import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/hospital.dart';
import '../repositories/bibaw_repository.dart';

class AddHospitalRecord extends UseCase {
  final BibawRepository _repository;

  AddHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addHospitalRecord();
  }
}

class EditHospitalRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  EditHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editHospitalRecord(hospitalID: params.hospitalID);
  }
}

class DeleteHospitalRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  DeleteHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteHospitalRecord(
        hospitalID: params.hospitalID);
  }
}

class RetrieveHospitalRecord extends UseCase<Hospital, Params> {
  final BibawRepository _repository;

  RetrieveHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Hospital>> call(Params params) async {
    return await _repository.retrieveHospitalRecord(
        hospitalID: params.hospitalID);
  }
}

class Params extends Equatable {
  final String hospitalID;

  const Params({@required this.hospitalID});

  @override
  List<Object> get props => [hospitalID];
}
