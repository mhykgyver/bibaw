import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/appointment.dart';
import '../repositories/bibaw_repository_domain_layer.dart';

class AddAppointment extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  AddAppointment({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.addAppointment(
      appointmentID: params._appointmentID,
      date: params._date,
      description: params._description,
      doctorID: params._doctorID,
      hospitalID: params._hospitalID,
      infantID: params._infantID,
    );
  }
}

class EditAppointment extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  EditAppointment({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.editAppointment(
      appointmentID: params._appointmentID,
      date: params._date,
      description: params._description,
      doctorID: params._doctorID,
      hospitalID: params._hospitalID,
      infantID: params._infantID,
    );
  }
}

class DeleteAppointment extends UseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteAppointment({repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await _repository.deleteAppointment(
        appointmentID: params._appointmentID);
  }
}

class RetrieveAppointment extends UseCase<Appointment, Params> {
  final IBibawRepository _repository;

  RetrieveAppointment({repository}) : _repository = repository;

  @override
  Future<Either<Failure, Appointment>> call(Params params) async {
    return await _repository.retrieveAppointment(
        appointmentID: params._appointmentID);
  }
}

class Params extends Equatable {
  final DateTime _date;
  final String _appointmentID;
  final String _description;
  final String _doctorID;
  final String _hospitalID;
  final String _infantID;

  const Params({
    appointmentID,
    date,
    description,
    doctorID,
    hospitalID,
    infantID,
  })  : _appointmentID = appointmentID,
        _date = date,
        _description = description,
        _doctorID = doctorID,
        _hospitalID = hospitalID,
        _infantID = infantID;

  @override
  List<Object> get props => [
        _appointmentID,
        _date,
        _description,
        _doctorID,
        _hospitalID,
        _infantID,
      ];
}
