import 'package:bibaw_app/core/error/failures.dart';
import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/entities/infant.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

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
