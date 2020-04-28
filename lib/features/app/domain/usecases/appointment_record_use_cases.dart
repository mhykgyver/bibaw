import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/appointment.dart';
import '../repositories/bibaw_repository.dart';

class AddAppointmentRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  AddAppointmentRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.addAppointmentRecord(
      doctorID: params._doctorID,
      hospitalID: params._hospitalID,
      infantID: params._infantID,
    );
  }
}

class EditAppointmentRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditAppointmentRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editAppointmentRecord(
        appointmentID: params._appointmentID);
  }
}

class DeleteAppointmentRecord extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteAppointmentRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteAppointmentRecord(
        appointmentID: params._appointmentID);
  }
}

class RetrieveAppointmentRecord extends UseCase<Appointment, Params> {
  final IBibawRepository _repository;

  RetrieveAppointmentRecord({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Appointment>> call(Params params) async {
    return await _repository.retrieveAppointmentRecord(
        appointmentID: params._appointmentID);
  }
}

class Params extends Equatable {
  final String _appointmentID;
  final String _infantID;
  final String _doctorID;
  final String _hospitalID;

  const Params({
    appointmentID,
    infantID,
    doctorID,
    hospitalID,
  })  : _appointmentID = appointmentID,
        _infantID = infantID,
        _doctorID = doctorID,
        _hospitalID = hospitalID;

  @override
  List<Object> get props => [
        _appointmentID,
        _infantID,
        _doctorID,
        _hospitalID,
      ];
}
