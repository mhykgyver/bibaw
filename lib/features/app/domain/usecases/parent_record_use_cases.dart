import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/parent.dart';
import '../repositories/bibaw_repository_domain_layer.dart';

class AddParentRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  AddParentRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.addParentRecord(
      birthDate: params._birthDate,
      firstName: params._firstName,
      gender: params._gender,
      lastName: params._lastName,
      middleInitial: params._middleInitial,
      parentID: params._parentID,
    );
  }
}

class EditParentRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditParentRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.editParentRecord(
      birthDate: params._birthDate,
      firstName: params._firstName,
      gender: params._gender,
      lastName: params._lastName,
      middleInitial: params._middleInitial,
      parentID: params._parentID,
    );
  }
}

class DeleteParentRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteParentRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.deleteParentRecord(parentID: params._parentID);
  }
}

class RetrieveParentRecord extends UseCase<Parent, Params> {
  final IBibawRepository _repository;

  RetrieveParentRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, Parent>> call(Params params) async {
    return await _repository.retrieveParentRecord(parentID: params._parentID);
  }
}

class Params extends Equatable {
  final DateTime _birthDate;
  final String _firstName;
  final String _gender;
  final String _lastName;
  final String _middleInitial;
  final String _parentID;

  const Params({
    @required parentID,
    birthDate,
    firstName,
    gender,
    lastName,
    middleInitial,
  })  : _birthDate = birthDate,
        _firstName = firstName,
        _gender = gender,
        _lastName = lastName,
        _middleInitial = middleInitial,
        _parentID = parentID;

  @override
  List<Object> get props => [
        _birthDate,
        _firstName,
        _gender,
        _lastName,
        _middleInitial,
        _parentID,
      ];
}
