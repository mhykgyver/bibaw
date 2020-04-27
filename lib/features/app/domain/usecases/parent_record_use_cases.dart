import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/parent.dart';
import '../repositories/bibaw_repository.dart';

class AddParentRecord extends UseCase {
  final BibawRepository _repository;

  AddParentRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addParentRecord();
  }
}

class EditParentRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  EditParentRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editParentRecord(parentID: params.parentID);
  }
}

class DeleteParentRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  DeleteParentRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteParentRecord(parentID: params.parentID);
  }
}

class RetrieveParentRecord extends UseCase<Parent, Params> {
  final BibawRepository _repository;

  RetrieveParentRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Parent>> call(Params params) async {
    return await _repository.retrieveParentRecord(parentID: params.parentID);
  }
}

class Params extends Equatable {
  final String parentID;

  const Params({@required this.parentID});

  @override
  List<Object> get props => [parentID];
}
