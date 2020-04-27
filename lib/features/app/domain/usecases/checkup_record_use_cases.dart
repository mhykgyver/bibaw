import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/checkup.dart';
import '../repositories/bibaw_repository.dart';

class AddCheckupRecord extends UseCase {
  final BibawRepository _repository;

  AddCheckupRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addCheckupRecord();
  }
}

class EditCheckupRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  EditCheckupRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editCheckupRecord(checkupID: params.checkupID);
  }
}

class DeleteCheckupRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  DeleteCheckupRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteCheckupRecord(checkupID: params.checkupID);
  }
}

class RetrieveCheckupRecord extends UseCase<Checkup, Params> {
  final BibawRepository _repository;

  RetrieveCheckupRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Checkup>> call(Params params) async {
    return await _repository.retrieveCheckupRecord(checkupID: params.checkupID);
  }
}

class Params extends Equatable {
  final String checkupID;

  const Params({@required this.checkupID});

  @override
  List<Object> get props => [checkupID];
}
