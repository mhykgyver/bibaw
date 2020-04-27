import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/infant.dart';
import '../repositories/bibaw_repository.dart';

class AddInfantRecord extends UseCase {
  final BibawRepository _repository;

  AddInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addInfantRecord();
  }
}

class EditInfantRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  EditInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editInfantRecord(infantID: params.infantID);
  }
}

class DeleteInfantRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  DeleteInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteInfantRecord(infantID: params.infantID);
  }
}

class RetrieveInfantRecord extends UseCase<Infant, Params> {
  final BibawRepository _repository;

  RetrieveInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Infant>> call(Params params) async {
    return await _repository.retrieveInfantRecord(infantID: params.infantID);
  }
}

class Params extends Equatable {
  final String infantID;

  const Params({@required this.infantID});

  @override
  List<Object> get props => [infantID];
}
