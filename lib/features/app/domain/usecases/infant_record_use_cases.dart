import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/infant.dart';
import '../repositories/bibaw_repository.dart';

class AddInfantRecord extends UseCase {
  final IBibawRepository _repository;

  AddInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addInfantRecord();
  }
}

class EditInfantRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editInfantRecord(infantID: params._infantID);
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

  const Params({@required infantID}) : _infantID = infantID;

  @override
  List<Object> get props => [_infantID];
}
