import 'package:bibaw_app/features/app/domain/entities/doctor_hospital.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../repositories/bibaw_repository.dart';

class AddDoctorHospitalRecord extends IUseCase<bool, Params> {
  final IBibawRepository _repository;

  AddDoctorHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.addDoctorHospitalRecord(
      doctorID: params._doctorID,
      hospitalID: params._hospitalID,
      consultationDaysHours: params._consultationDaysHours,
      contactNo: params._contactNo,
      roomNo: params._roomNo,
    );
  }
}

class EditDoctorHospitalRecord extends IUseCase<bool, Params> {
  final IBibawRepository _repository;

  EditDoctorHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.editDoctorHospitalRecord(
      doctorID: params._doctorID,
      hospitalID: params._hospitalID,
      consultationDaysHours: params._consultationDaysHours,
      contactNo: params._contactNo,
      roomNo: params._roomNo,
    );
  }
}

class DeleteDoctorHospitalRecord extends IUseCase<bool, Params> {
  final IBibawRepository _repository;

  DeleteDoctorHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, bool>> call(Params params) async {
    return await _repository.deleteDoctorHospitalRecord(
        doctorID: params._doctorID);
  }
}

class RetrieveDoctorHospitalRecord extends IUseCase<DoctorHospital, Params> {
  final IBibawRepository _repository;

  RetrieveDoctorHospitalRecord({repository}) : _repository = repository;

  @override
  Future<Either<IFailure, DoctorHospital>> call(Params params) async {
    return await _repository.retrieveDoctorHospitalRecord(
        doctorID: params._doctorID);
  }
}

class Params extends Equatable {
  final String _doctorID;
  final String _hospitalID;
  final String _consultationDaysHours;
  final String _contactNo;
  final String _roomNo;

  const Params({
    @required doctorID,
    hospitalID,
    consultationDaysHours,
    contactNo,
    roomNo,
  })  : _doctorID = doctorID,
        _hospitalID = hospitalID,
        _consultationDaysHours = consultationDaysHours,
        _contactNo = contactNo,
        _roomNo = roomNo;

  @override
  List<Object> get props => [
        _doctorID,
        _hospitalID,
        _consultationDaysHours,
        _contactNo,
        _roomNo,
      ];
}
