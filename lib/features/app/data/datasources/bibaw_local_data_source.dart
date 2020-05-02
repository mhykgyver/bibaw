import '../models/appointment_model.dart';
import '../models/checkup_model.dart';
import '../models/doctor_hospital_model.dart';
import '../models/doctor_model.dart';
import '../models/hospital_model.dart';
import '../models/infant_model.dart';
import '../models/parent_model.dart';

abstract class IBibawLocalDataSource {
  Future<bool> addAppointment(
      {DateTime date,
      String appointmentID,
      String description,
      String doctorID,
      String hospitalID,
      String infantID}) {
    // TODO: implement addAppointment
    return null;
  }

  Future<bool> deleteAppointment({String appointmentID}) {
    // TODO: implement deleteAppointment
    return null;
  }

  Future<bool> editAppointment(
      {DateTime date,
      String appointmentID,
      String description,
      String doctorID,
      String hospitalID,
      String infantID}) {
    // TODO: implement editAppointment
    return null;
  }

  Future<AppointmentModel> retrieveAppointment({String appointmentID}) {
    // TODO: implement retrieveAppointment
    return null;
  }

  Future<bool> addCheckup(
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

  Future<bool> deleteCheckup({String checkupID}) {
    // TODO: implement deleteCheckup
    return null;
  }

  Future<bool> editCheckup(
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

  Future<CheckupModel> retrieveCheckup({String checkupID}) {
    // TODO: implement retrieveCheckup
    return null;
  }

  Future<bool> addDoctorHospitalRecord(
      {String doctorID,
      String hospitalID,
      String consultationDaysHours,
      String contactNo,
      String roomNo}) {
    // TODO: implement addDoctorHospitalRecord
    return null;
  }

  Future<bool> deleteDoctorHospitalRecord({String doctorID}) {
    // TODO: implement deleteDoctorHospitalRecord
    return null;
  }

  Future<bool> editDoctorHospitalRecord(
      {String doctorID,
      String hospitalID,
      String consultationDaysHours,
      String contactNo,
      String roomNo}) {
    // TODO: implement editDoctorHospitalRecord
    return null;
  }

  Future<DoctorHospitalModel> retrieveDoctorHospitalRecord({String doctorID}) {
    // TODO: implement retrieveDoctorHospitalRecord
    return null;
  }

  Future<bool> addDoctorRecord(
      {String doctorID,
      String firstName,
      String lastName,
      String middleInitial,
      String practice}) {
    // TODO: implement addDoctorRecord
    return null;
  }

  Future<bool> deleteDoctorRecord({String doctorID}) {
    // TODO: implement deleteDoctorRecord
    return null;
  }

  Future<bool> editDoctorRecord(
      {String doctorID,
      String firstName,
      String lastName,
      String middleInitial,
      String practice}) {
    // TODO: implement editDoctorRecord
    return null;
  }

  Future<DoctorModel> retrieveDoctorRecord({String doctorID}) {
    // TODO: implement retrieveDoctorRecord
    return null;
  }

  Future<bool> addHospitalRecord(
      {String hospitalID, String name, String location, String contactNo}) {
    // TODO: implement addHospitalRecord
    return null;
  }

  Future<bool> deleteHospitalRecord({String hospitalID}) {
    // TODO: implement deleteHospitalRecord
    return null;
  }

  Future<bool> editHospitalRecord(
      {String hospitalID, String name, String location, String contactNo}) {
    // TODO: implement editHospitalRecord
    return null;
  }

  Future<HospitalModel> retrieveHospitalRecord({String hospitalID}) {
    // TODO: implement retrieveHospitalRecord
    return null;
  }

  Future<bool> addInfantRecord(
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

  Future<bool> deleteInfantRecord({String infantID}) {
    // TODO: implement deleteInfantRecord
    return null;
  }

  Future<bool> editInfantRecord(
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

  Future<InfantModel> retrieveInfantRecord({String infantID}) {
    // TODO: implement retrieveInfantRecord
    return null;
  }

  Future<bool> addParentRecord(
      {DateTime birthDate,
      String firstName,
      String gender,
      String lastName,
      String middleInitial,
      String parentID}) {
    // TODO: implement addParentRecord
    return null;
  }

  Future<bool> deleteParentRecord({String parentID}) {
    // TODO: implement deleteParentRecord
    return null;
  }

  Future<bool> editParentRecord(
      {DateTime birthDate,
      String firstName,
      String gender,
      String lastName,
      String middleInitial,
      String parentID}) {
    // TODO: implement editParentRecord
    return null;
  }

  Future<ParentModel> retrieveParentRecord({String parentID}) {
    // TODO: implement retrieveParentRecord
    return null;
  }
}
