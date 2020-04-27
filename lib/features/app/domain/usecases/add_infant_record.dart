import 'package:bibaw_app/core/error/failures.dart';
import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:dartz/dartz.dart';

class AddInfantRecord extends UseCase {
  final BibawRepository _repository;

  AddInfantRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _repository.addInfantRecord();
  }
}
