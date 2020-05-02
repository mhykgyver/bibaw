import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/appointment.dart';
import '../entities/checkup.dart';
import '../entities/doctor.dart';
import '../entities/doctor_hospital.dart';
import '../entities/hospital.dart';
import '../entities/infant.dart';
import '../entities/parent.dart';

// TODO: refactor by entity repository

abstract class IBibawRepository {
  // Appointments
  Future<Either<IFailure, bool>> addAppointment({
    DateTime date,
    String appointmentID,
    String description,
    String doctorID,
    String hospitalID,
    String infantID,
  });
  Future<Either<IFailure, bool>> editAppointment({
    DateTime date,
    String appointmentID,
    String description,
    String doctorID,
    String hospitalID,
    String infantID,
  });
  Future<Either<IFailure, bool>> deleteAppointment({String appointmentID});
  Future<Either<IFailure, Appointment>> retrieveAppointment(
      {String appointmentID});

  // Checkups
  Future<Either<IFailure, bool>> addCheckup({
    String checkupID,
    DateTime date,
    double weight,
    double height,
    double circumferenceHead,
    String problems,
    String medication,
    String instructions,
  });
  Future<Either<IFailure, bool>> editCheckup({
    String checkupID,
    DateTime date,
    double weight,
    double height,
    double circumferenceHead,
    String problems,
    String medication,
    String instructions,
  });
  Future<Either<IFailure, bool>> deleteCheckup({String checkupID});
  Future<Either<IFailure, Checkup>> retrieveCheckup({String checkupID});

  // Doctors
  Future<Either<IFailure, bool>> addDoctorRecord({
    String doctorID,
    String firstName,
    String lastName,
    String middleInitial,
    String practice,
  });
  Future<Either<IFailure, bool>> editDoctorRecord({
    String doctorID,
    String firstName,
    String lastName,
    String middleInitial,
    String practice,
  });
  Future<Either<IFailure, bool>> deleteDoctorRecord({String doctorID});
  Future<Either<IFailure, Doctor>> retrieveDoctorRecord({String doctorID});

  // Doctor Hospitals
  Future<Either<IFailure, bool>> addDoctorHospitalRecord({
    String doctorID,
    String hospitalID,
    String consultationDaysHours,
    String contactNo,
    String roomNo,
  });
  Future<Either<IFailure, bool>> editDoctorHospitalRecord({
    String doctorID,
    String hospitalID,
    String consultationDaysHours,
    String contactNo,
    String roomNo,
  });
  Future<Either<IFailure, bool>> deleteDoctorHospitalRecord({String doctorID});
  Future<Either<IFailure, DoctorHospital>> retrieveDoctorHospitalRecord(
      {String doctorID});

  // Hospitals
  Future<Either<IFailure, bool>> addHospitalRecord({
    String hospitalID,
    String name,
    String location,
    String contactNo,
  });
  Future<Either<IFailure, bool>> editHospitalRecord({
    String hospitalID,
    String name,
    String location,
    String contactNo,
  });
  Future<Either<IFailure, bool>> deleteHospitalRecord({String hospitalID});
  Future<Either<IFailure, Hospital>> retrieveHospitalRecord(
      {String hospitalID});

  // Infants
  Future<Either<IFailure, bool>> addInfantRecord({
    String infantID,
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
    String hospitalID,
  });
  Future<Either<IFailure, bool>> editInfantRecord({
    String infantID,
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
    String hospitalID,
  });
  Future<Either<IFailure, bool>> deleteInfantRecord({String infantID});
  Future<Either<IFailure, Infant>> retrieveInfantRecord({String infantID});

  // Parents
  Future<Either<IFailure, bool>> addParentRecord({
    DateTime birthDate,
    String firstName,
    String gender,
    String lastName,
    String middleInitial,
    String parentID,
  });
  Future<Either<IFailure, bool>> editParentRecord({
    DateTime birthDate,
    String firstName,
    String gender,
    String lastName,
    String middleInitial,
    String parentID,
  });
  Future<Either<IFailure, bool>> deleteParentRecord({String parentID});
  Future<Either<IFailure, Parent>> retrieveParentRecord({String parentID});
}
