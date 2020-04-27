import 'package:bibaw_app/features/app/domain/entities/doctor.dart';
import 'package:bibaw_app/features/app/domain/entities/hospital.dart';
import 'package:bibaw_app/features/app/domain/entities/parent.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/checkup_record.dart';
import '../entities/infant.dart';

abstract class BibawRepository {
  // Checkups
  Future<Either<Failure, bool>> addCheckupRecord(
      {String infantID, String doctorID, String hospitalID});
  Future<Either<Failure, bool>> editCheckupRecord({String checkupID});
  Future<Either<Failure, bool>> deleteCheckupRecord({String checkupID});
  Future<Either<Failure, CheckupRecord>> retrieveCheckupRecord(
      [String checkupID]);

  // Doctors
  Future<Either<Failure, bool>> addDoctorRecord();
  Future<Either<Failure, bool>> editDoctorRecord({String doctorID});
  Future<Either<Failure, bool>> deleteDoctorRecord({String doctorID});
  Future<Either<Failure, Doctor>> retrieveDoctorRecord({String doctorID});

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
  Future<Either<Failure, bool>> editParentRecord(String parentID);
  Future<Either<Failure, bool>> deleteParentRecord(String parentID);
  Future<Either<Failure, Parent>> retrieveParentRecord({String parentID});
}
