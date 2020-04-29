import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/checkup.dart';
import '../repositories/bibaw_repository_domain_layer.dart';

class AddCheckup extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  AddCheckup({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.addCheckup(
      checkupID: params._checkupID,
      circumferenceHead: params._circumferenceHead,
      date: params._date,
      height: params._height,
      instructions: params._instructions,
      medication: params._medication,
      problems: params._problems,
      weight: params._weight,
    );
  }
}

class EditCheckup extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditCheckup({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editCheckup(
      checkupID: params._checkupID,
      circumferenceHead: params._circumferenceHead,
      date: params._date,
      height: params._height,
      instructions: params._instructions,
      medication: params._medication,
      problems: params._problems,
      weight: params._weight,
    );
  }
}

class DeleteCheckup extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteCheckup({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteCheckup(checkupID: params._checkupID);
  }
}

class RetrieveCheckup extends UseCase<Checkup, Params> {
  final IBibawRepository _repository;

  RetrieveCheckup({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Checkup>> call(Params params) async {
    return await _repository.retrieveCheckup(checkupID: params._checkupID);
  }
}

class Params extends Equatable {
  final String _checkupID;
  final DateTime _date;
  final double _weight;
  final double _height;
  final double _circumferenceHead;
  final String _problems;
  final String _medication;
  final String _instructions;

  const Params({
    checkupID,
    date,
    weight,
    height,
    circumferenceHead,
    problems,
    medication,
    instructions,
  })  : _checkupID = checkupID,
        _date = date,
        _weight = weight,
        _height = height,
        _circumferenceHead = circumferenceHead,
        _problems = problems,
        _medication = medication,
        _instructions = instructions;

  @override
  List<Object> get props => [
        _checkupID,
        _date,
        _weight,
        _height,
        _circumferenceHead,
        _problems,
        _medication,
        _instructions,
      ];
}
