import 'package:bibaw_app/features/app/domain/entities/appointment.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor_hospital.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/checkup.dart';
import '../entities/doctor.dart';
import '../entities/hospital.dart';
import '../entities/infant.dart';
import '../entities/parent.dart';

abstract class IBibawRepository {
  // Appointments
  Future<Either<Failure, bool>> addAppointmentRecord(
      {String infantID, String doctorID, String hospitalID});
  Future<Either<Failure, bool>> editAppointmentRecord({String appointmentID});
  Future<Either<Failure, bool>> deleteAppointmentRecord({String appointmentID});
  Future<Either<Failure, Appointment>> retrieveAppointmentRecord(
      {String appointmentID});

  // Checkups
  Future<Either<Failure, bool>> addCheckupRecord(
      {String infantID, String doctorID, String hospitalID});
  Future<Either<Failure, bool>> editCheckupRecord({String checkupID});
  Future<Either<Failure, bool>> deleteCheckupRecord({String checkupID});
  Future<Either<Failure, Checkup>> retrieveCheckupRecord({String checkupID});

  // Doctors
  Future<Either<Failure, bool>> addDoctorRecord();
  Future<Either<Failure, bool>> editDoctorRecord({String doctorID});
  Future<Either<Failure, bool>> deleteDoctorRecord({String doctorID});
  Future<Either<Failure, Doctor>> retrieveDoctorRecord({String doctorID});

  // Doctor Hospitals
  Future<Either<Failure, bool>> addDoctorHospitalRecord({
    String doctorID,
    String hospitalID,
    String consultationDaysHours,
    String contactNo,
  });
  Future<Either<Failure, bool>> editDoctorHospitalRecord({String doctorID});
  Future<Either<Failure, bool>> deleteDoctorHospitalRecord({String doctorID});
  Future<Either<Failure, DoctorHospital>> retrieveDoctorHospitalRecord(
      {String doctorID});

  // Hospitals
  Future<Either<Failure, bool>> addHospitalRecord();
  Future<Either<Failure, bool>> editHospitalRecord({String hospitalID});
  Future<Either<Failure, bool>> deleteHospitalRecord({String hospitalID});
  Future<Either<Failure, Hospital>> retrieveHospitalRecord({String hospitalID});

  // Infants
  Future<Either<Failure, bool>> addInfantRecord();
  Future<Either<Failure, bool>> editInfantRecord({String infantID});
  Future<Either<Failure, bool>> deleteInfantRecord({String infantID});
  Future<Either<Failure, Infant>> retrieveInfantRecord({String infantID});

  // Parents
  Future<Either<Failure, bool>> addParentRecord();
  Future<Either<Failure, bool>> editParentRecord({String parentID});
  Future<Either<Failure, bool>> deleteParentRecord({String parentID});
  Future<Either<Failure, Parent>> retrieveParentRecord({String parentID});
}
