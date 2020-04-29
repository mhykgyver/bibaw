import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/appointment.dart';
import '../entities/checkup.dart';
import '../entities/doctor.dart';
import '../entities/doctor_hospital.dart';
import '../entities/hospital.dart';
import '../entities/infant.dart';
import '../entities/parent.dart';

abstract class IBibawRepository {
  // Appointments
  Future<Either<Failure, bool>> addAppointment({
    DateTime date,
    String appointmentID,
    String description,
    String doctorID,
    String hospitalID,
    String infantID,
  });
  Future<Either<Failure, bool>> editAppointment({
    DateTime date,
    String appointmentID,
    String description,
    String doctorID,
    String hospitalID,
    String infantID,
  });
  Future<Either<Failure, bool>> deleteAppointment({String appointmentID});
  Future<Either<Failure, Appointment>> retrieveAppointment(
      {String appointmentID});

  // Checkups
  Future<Either<Failure, bool>> addCheckup({
    String checkupID,
    DateTime date,
    double weight,
    double height,
    double circumferenceHead,
    String problems,
    String medication,
    String instructions,
  });
  Future<Either<Failure, bool>> editCheckup({
    String checkupID,
    DateTime date,
    double weight,
    double height,
    double circumferenceHead,
    String problems,
    String medication,
    String instructions,
  });
  Future<Either<Failure, bool>> deleteCheckup({String checkupID});
  Future<Either<Failure, Checkup>> retrieveCheckup({String checkupID});

  // Doctors
  Future<Either<Failure, bool>> addDoctorRecord({
    String doctorID,
    String firstName,
    String lastName,
    String middleInitial,
    String practice,
  });
  Future<Either<Failure, bool>> editDoctorRecord({
    String doctorID,
    String firstName,
    String lastName,
    String middleInitial,
    String practice,
  });
  Future<Either<Failure, bool>> deleteDoctorRecord({String doctorID});
  Future<Either<Failure, Doctor>> retrieveDoctorRecord({String doctorID});

  // Doctor Hospitals
  Future<Either<Failure, bool>> addDoctorHospitalRecord({
    String doctorID,
    String hospitalID,
    String consultationDaysHours,
    String contactNo,
    String roomNo,
  });
  Future<Either<Failure, bool>> editDoctorHospitalRecord({
    String doctorID,
    String hospitalID,
    String consultationDaysHours,
    String contactNo,
    String roomNo,
  });
  Future<Either<Failure, bool>> deleteDoctorHospitalRecord({String doctorID});
  Future<Either<Failure, DoctorHospital>> retrieveDoctorHospitalRecord(
      {String doctorID});

  // Hospitals
  Future<Either<Failure, bool>> addHospitalRecord({
    String hospitalID,
    String name,
    String location,
    String contactNo,
  });
  Future<Either<Failure, bool>> editHospitalRecord({
    String hospitalID,
    String name,
    String location,
    String contactNo,
  });
  Future<Either<Failure, bool>> deleteHospitalRecord({String hospitalID});
  Future<Either<Failure, Hospital>> retrieveHospitalRecord({String hospitalID});

  // Infants
  Future<Either<Failure, bool>> addInfantRecord({
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
  Future<Either<Failure, bool>> editInfantRecord({
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
  Future<Either<Failure, bool>> deleteInfantRecord({String infantID});
  Future<Either<Failure, Infant>> retrieveInfantRecord({String infantID});

  // Parents
  Future<Either<Failure, bool>> addParentRecord({
    DateTime birthDate,
    String firstName,
    String gender,
    String lastName,
    String middleInitial,
    String parentID,
  });
  Future<Either<Failure, bool>> editParentRecord({
    DateTime birthDate,
    String firstName,
    String gender,
    String lastName,
    String middleInitial,
    String parentID,
  });
  Future<Either<Failure, bool>> deleteParentRecord({String parentID});
  Future<Either<Failure, Parent>> retrieveParentRecord({String parentID});
}
