import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/checkup.dart';
import '../repositories/bibaw_repository.dart';

class AddCheckupRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  AddCheckupRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.addCheckupRecord(
      doctorID: params._doctorID,
      hospitalID: params._hospitalID,
      infantID: params._infantID,
    );
  }
}

class EditCheckupRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditCheckupRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editCheckupRecord(checkupID: params._checkupID);
  }
}

class DeleteCheckupRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteCheckupRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteCheckupRecord(checkupID: params._checkupID);
  }
}

class RetrieveCheckupRecord extends UseCase<Checkup, Params> {
  final IBibawRepository _repository;

  RetrieveCheckupRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Checkup>> call(Params params) async {
    return await _repository.retrieveCheckupRecord(
        checkupID: params._checkupID);
  }
}

class Params extends Equatable {
  final String _checkupID;
  final String _infantID;
  final String _doctorID;
  final String _hospitalID;

  const Params({
    checkupID,
    infantID,
    doctorID,
    hospitalID,
  })  : _checkupID = checkupID,
        _infantID = infantID,
        _doctorID = doctorID,
        _hospitalID = hospitalID;

  @override
  List<Object> get props => [
        _checkupID,
        _infantID,
        _doctorID,
        _hospitalID,
      ];
}
