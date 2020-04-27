import 'package:bibaw_app/core/error/failures.dart';
import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class EditInfantRecord extends UseCase<bool, Params> {
  final BibawRepository _repository;

  EditInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editInfantRecord(infantID: params.infantID);
  }
}

class Params extends Equatable {
  final String infantID;

  const Params({@required this.infantID});

  @override
  List<Object> get props => [infantID];
}
