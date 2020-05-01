import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/entities/checkup.dart';
import '../../domain/entities/doctor.dart';
import '../../domain/entities/doctor_hospital.dart';
import '../../domain/entities/hospital.dart';
import '../../domain/entities/infant.dart';
import '../../domain/entities/parent.dart';
import '../../domain/repositories/bibaw_repository_domain_layer.dart';

class BibawRepository implements IBibawRepository {
  @override
  Future<Either<IFailure, bool>> addAppointment(
      {DateTime date,
      String appointmentID,
      String description,
      String doctorID,
      String hospitalID,
      String infantID}) {
    // TODO: implement addAppointment
    return null;
  }

  @override
  Future<Either<IFailure, bool>> addCheckup(
      {String checkupID,
      DateTime date,
      double weight,
      double height,
      double circumferenceHead,
      String problems,
      String medication,
      String instructions}) {
    // TODO: implement addCheckup
    return null;
  }

  @override
  Future<Either<IFailure, bool>> addDoctorHospitalRecord(
      {String doctorID,
      String hospitalID,
      String consultationDaysHours,
      String contactNo,
      String roomNo}) {
    // TODO: implement addDoctorHospitalRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> addDoctorRecord(
      {String doctorID,
      String firstName,
      String lastName,
      String middleInitial,
      String practice}) {
    // TODO: implement addDoctorRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> addHospitalRecord(
      {String hospitalID, String name, String location, String contactNo}) {
    // TODO: implement addHospitalRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> addInfantRecord(
      {String infantID,
      String firstName,
      String lastName,
      String middleInitial,
      String gender,
      DateTime birthDate,
      String birthPlace,
      double weight,
      double height,
      double circumferenceHead,
      double circumferenceChest,
      double circumferenceAbdominal,
      String scoreAPGAR,
      String birthProblems,
      String distinguishingMarks,
      String deliveryType,
      String parentID,
      String obstetricianID,
      String pediatricianID,
      String hospitalID}) {
    // TODO: implement addInfantRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> addParentRecord(
      {DateTime birthDate,
      String firstName,
      String gender,
      String lastName,
      String middleInitial,
      String parentID}) {
    // TODO: implement addParentRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> deleteAppointment({String appointmentID}) {
    // TODO: implement deleteAppointment
    return null;
  }

  @override
  Future<Either<IFailure, bool>> deleteCheckup({String checkupID}) {
    // TODO: implement deleteCheckup
    return null;
  }

  @override
  Future<Either<IFailure, bool>> deleteDoctorHospitalRecord({String doctorID}) {
    // TODO: implement deleteDoctorHospitalRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> deleteDoctorRecord({String doctorID}) {
    // TODO: implement deleteDoctorRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> deleteHospitalRecord({String hospitalID}) {
    // TODO: implement deleteHospitalRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> deleteInfantRecord({String infantID}) {
    // TODO: implement deleteInfantRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> deleteParentRecord({String parentID}) {
    // TODO: implement deleteParentRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> editAppointment(
      {DateTime date,
      String appointmentID,
      String description,
      String doctorID,
      String hospitalID,
      String infantID}) {
    // TODO: implement editAppointment
    return null;
  }

  @override
  Future<Either<IFailure, bool>> editCheckup(
      {String checkupID,
      DateTime date,
      double weight,
      double height,
      double circumferenceHead,
      String problems,
      String medication,
      String instructions}) {
    // TODO: implement editCheckup
    return null;
  }

  @override
  Future<Either<IFailure, bool>> editDoctorHospitalRecord(
      {String doctorID,
      String hospitalID,
      String consultationDaysHours,
      String contactNo,
      String roomNo}) {
    // TODO: implement editDoctorHospitalRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> editDoctorRecord(
      {String doctorID,
      String firstName,
      String lastName,
      String middleInitial,
      String practice}) {
    // TODO: implement editDoctorRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> editHospitalRecord(
      {String hospitalID, String name, String location, String contactNo}) {
    // TODO: implement editHospitalRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> editInfantRecord(
      {String infantID,
      String firstName,
      String lastName,
      String middleInitial,
      String gender,
      DateTime birthDate,
      String birthPlace,
      double weight,
      double height,
      double circumferenceHead,
      double circumferenceChest,
      double circumferenceAbdominal,
      String scoreAPGAR,
      String birthProblems,
      String distinguishingMarks,
      String deliveryType,
      String parentID,
      String obstetricianID,
      String pediatricianID,
      String hospitalID}) {
    // TODO: implement editInfantRecord
    return null;
  }

  @override
  Future<Either<IFailure, bool>> editParentRecord(
      {DateTime birthDate,
      String firstName,
      String gender,
      String lastName,
      String middleInitial,
      String parentID}) {
    // TODO: implement editParentRecord
    return null;
  }

  @override
  Future<Either<IFailure, Appointment>> retrieveAppointment(
      {String appointmentID}) {
    // TODO: implement retrieveAppointment
    return null;
  }

  @override
  Future<Either<IFailure, Checkup>> retrieveCheckup({String checkupID}) {
    // TODO: implement retrieveCheckup
    return null;
  }

  @override
  Future<Either<IFailure, DoctorHospital>> retrieveDoctorHospitalRecord(
      {String doctorID}) {
    // TODO: implement retrieveDoctorHospitalRecord
    return null;
  }

  @override
  Future<Either<IFailure, Doctor>> retrieveDoctorRecord({String doctorID}) {
    // TODO: implement retrieveDoctorRecord
    return null;
  }

  @override
  Future<Either<IFailure, Hospital>> retrieveHospitalRecord(
      {String hospitalID}) {
    // TODO: implement retrieveHospitalRecord
    return null;
  }

  @override
  Future<Either<IFailure, Infant>> retrieveInfantRecord({String infantID}) {
    // TODO: implement retrieveInfantRecord
    return null;
  }

  @override
  Future<Either<IFailure, Parent>> retrieveParentRecord({String parentID}) {
    // TODO: implement retrieveParentRecord
    return null;
  }
}
