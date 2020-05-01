import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/appointment_model.dart';
import '../models/checkup_model.dart';
import '../models/doctor_hospital_model.dart';
import '../models/doctor_model.dart';
import '../models/hospital_model.dart';
import '../models/infant_model.dart';
import '../models/parent_model.dart';

abstract class IBibawRemoteDataSource {
  Future<AppointmentModel> addAppointment(
      {DateTime date,
      String appointmentID,
      String description,
      String doctorID,
      String hospitalID,
      String infantID}) {
    // TODO: implement addAppointment
    return null;
  }

  Future<CheckupModel> addCheckup(
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

  Future<DoctorHospitalModel> addDoctorHospitalRecord(
      {String doctorID,
      String hospitalID,
      String consultationDaysHours,
      String contactNo,
      String roomNo}) {
    // TODO: implement addDoctorHospitalRecord
    return null;
  }

  Future<DoctorModel> addDoctorRecord(
      {String doctorID,
      String firstName,
      String lastName,
      String middleInitial,
      String practice}) {
    // TODO: implement addDoctorRecord
    return null;
  }

  Future<HospitalModel> addHospitalRecord(
      {String hospitalID, String name, String location, String contactNo}) {
    // TODO: implement addHospitalRecord
    return null;
  }

  Future<InfantModel> addInfantRecord(
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

  Future<ParentModel> addParentRecord(
      {DateTime birthDate,
      String firstName,
      String gender,
      String lastName,
      String middleInitial,
      String parentID}) {
    // TODO: implement addParentRecord
    return null;
  }

  Future<AppointmentModel> deleteAppointment({String appointmentID}) {
    // TODO: implement deleteAppointment
    return null;
  }

  Future<CheckupModel> deleteCheckup({String checkupID}) {
    // TODO: implement deleteCheckup
    return null;
  }

  Future<DoctorHospitalModel> deleteDoctorHospitalRecord({String doctorID}) {
    // TODO: implement deleteDoctorHospitalRecord
    return null;
  }

  Future<DoctorModel> deleteDoctorRecord({String doctorID}) {
    // TODO: implement deleteDoctorRecord
    return null;
  }

  Future<HospitalModel> deleteHospitalRecord({String hospitalID}) {
    // TODO: implement deleteHospitalRecord
    return null;
  }

  Future<InfantModel> deleteInfantRecord({String infantID}) {
    // TODO: implement deleteInfantRecord
    return null;
  }

  Future<ParentModel> deleteParentRecord({String parentID}) {
    // TODO: implement deleteParentRecord
    return null;
  }

  Future<AppointmentModel> editAppointment(
      {DateTime date,
      String appointmentID,
      String description,
      String doctorID,
      String hospitalID,
      String infantID}) {
    // TODO: implement editAppointment
    return null;
  }

  Future<CheckupModel> editCheckup(
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

  Future<DoctorHospitalModel> editDoctorHospitalRecord(
      {String doctorID,
      String hospitalID,
      String consultationDaysHours,
      String contactNo,
      String roomNo}) {
    // TODO: implement editDoctorHospitalRecord
    return null;
  }

  Future<DoctorModel> editDoctorRecord(
      {String doctorID,
      String firstName,
      String lastName,
      String middleInitial,
      String practice}) {
    // TODO: implement editDoctorRecord
    return null;
  }

  Future<HospitalModel> editHospitalRecord(
      {String hospitalID, String name, String location, String contactNo}) {
    // TODO: implement editHospitalRecord
    return null;
  }

  Future<InfantModel> editInfantRecord(
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

  Future<ParentModel> editParentRecord(
      {DateTime birthDate,
      String firstName,
      String gender,
      String lastName,
      String middleInitial,
      String parentID}) {
    // TODO: implement editParentRecord
    return null;
  }

  Future<AppointmentModel> retrieveAppointment({String appointmentID}) {
    // TODO: implement retrieveAppointment
    return null;
  }

  Future<CheckupModel> retrieveCheckup({String checkupID}) {
    // TODO: implement retrieveCheckup
    return null;
  }

  Future<DoctorHospitalModel> retrieveDoctorHospitalRecord({String doctorID}) {
    // TODO: implement retrieveDoctorHospitalRecord
    return null;
  }

  Future<DoctorModel> retrieveDoctorRecord({String doctorID}) {
    // TODO: implement retrieveDoctorRecord
    return null;
  }

  Future<HospitalModel> retrieveHospitalRecord({String hospitalID}) {
    // TODO: implement retrieveHospitalRecord
    return null;
  }

  Future<InfantModel> retrieveInfantRecord({String infantID}) {
    // TODO: implement retrieveInfantRecord
    return null;
  }

  Future<ParentModel> retrieveParentRecord({String parentID}) {
    // TODO: implement retrieveParentRecord
    return null;
  }
}
