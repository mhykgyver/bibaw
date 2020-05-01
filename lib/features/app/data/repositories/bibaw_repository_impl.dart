import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/appointment.dart';
import '../../domain/entities/checkup.dart';
import '../../domain/entities/doctor.dart';
import '../../domain/entities/doctor_hospital.dart';
import '../../domain/entities/hospital.dart';
import '../../domain/entities/infant.dart';
import '../../domain/entities/parent.dart';
import '../../domain/repositories/bibaw_repository.dart';
import '../datasources/bibaw_local_data_source.dart';
import '../datasources/bibaw_remote_data_source.dart';

class BibawRepositoryImpl implements IBibawRepository {
  final IBibawRemoteDataSource remoteDataSource;
  final IBibawLocalDataSource localDataSource;
  final INetworkInfo networkInfo;

  const BibawRepositoryImpl({
    this.localDataSource,
    this.networkInfo,
    this.remoteDataSource,
  });

  //Appointment Use Cases
  @override
  Future<Either<IFailure, bool>> addAppointment({
    DateTime date,
    String appointmentID,
    String description,
    String doctorID,
    String hospitalID,
    String infantID,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.addAppointment(
      appointmentID: appointmentID,
      date: date,
      description: description,
      doctorID: doctorID,
      hospitalID: hospitalID,
      infantID: infantID,
    ));
  }

  @override
  Future<Either<IFailure, bool>> deleteAppointment(
      {String appointmentID}) async {
    networkInfo.isConnected;
    return Right(
        await remoteDataSource.deleteAppointment(appointmentID: appointmentID));
  }

  @override
  Future<Either<IFailure, bool>> editAppointment({
    DateTime date,
    String appointmentID,
    String description,
    String doctorID,
    String hospitalID,
    String infantID,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.editAppointment(
      appointmentID: appointmentID,
      date: date,
      description: description,
      doctorID: doctorID,
      hospitalID: hospitalID,
      infantID: infantID,
    ));
  }

  @override
  Future<Either<IFailure, Appointment>> retrieveAppointment(
      {String appointmentID}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.retrieveAppointment(
        appointmentID: appointmentID));
  }

// Checkup Record Use Cases
  @override
  Future<Either<IFailure, bool>> addCheckup({
    String checkupID,
    DateTime date,
    double weight,
    double height,
    double circumferenceHead,
    String problems,
    String medication,
    String instructions,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.addCheckup(
      checkupID: checkupID,
      circumferenceHead: circumferenceHead,
      date: date,
      height: height,
      instructions: instructions,
      medication: medication,
      problems: problems,
      weight: weight,
    ));
  }

  @override
  Future<Either<IFailure, bool>> deleteCheckup({String checkupID}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.deleteCheckup(checkupID: checkupID));
  }

  @override
  Future<Either<IFailure, bool>> editCheckup({
    String checkupID,
    DateTime date,
    double weight,
    double height,
    double circumferenceHead,
    String problems,
    String medication,
    String instructions,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.editCheckup(
      checkupID: checkupID,
      circumferenceHead: circumferenceHead,
      date: date,
      height: height,
      instructions: instructions,
      medication: medication,
      problems: problems,
      weight: weight,
    ));
  }

  @override
  Future<Either<IFailure, Checkup>> retrieveCheckup({String checkupID}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.retrieveCheckup(checkupID: checkupID));
  }

// DoctorHospital Records Use Cases
  @override
  Future<Either<IFailure, bool>> addDoctorHospitalRecord({
    String doctorID,
    String hospitalID,
    String consultationDaysHours,
    String contactNo,
    String roomNo,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.addDoctorHospitalRecord(
      consultationDaysHours: consultationDaysHours,
      contactNo: contactNo,
      doctorID: doctorID,
      hospitalID: hospitalID,
      roomNo: roomNo,
    ));
  }

  @override
  Future<Either<IFailure, bool>> deleteDoctorHospitalRecord(
      {String doctorID}) async {
    networkInfo.isConnected;
    return Right(
        await remoteDataSource.deleteDoctorHospitalRecord(doctorID: doctorID));
  }

  @override
  Future<Either<IFailure, bool>> editDoctorHospitalRecord({
    String doctorID,
    String hospitalID,
    String consultationDaysHours,
    String contactNo,
    String roomNo,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.editDoctorHospitalRecord(
      consultationDaysHours: consultationDaysHours,
      contactNo: contactNo,
      doctorID: doctorID,
      hospitalID: hospitalID,
      roomNo: roomNo,
    ));
  }

  @override
  Future<Either<IFailure, DoctorHospital>> retrieveDoctorHospitalRecord(
      {String doctorID}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.retrieveDoctorHospitalRecord(
        doctorID: doctorID));
  }

// Doctor Records Use Cases
  @override
  Future<Either<IFailure, bool>> addDoctorRecord({
    String doctorID,
    String firstName,
    String lastName,
    String middleInitial,
    String practice,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.addDoctorRecord(
      doctorID: doctorID,
      firstName: firstName,
      lastName: lastName,
      middleInitial: middleInitial,
      practice: practice,
    ));
  }

  @override
  Future<Either<IFailure, bool>> deleteDoctorRecord({String doctorID}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.deleteDoctorRecord(doctorID: doctorID));
  }

  @override
  Future<Either<IFailure, bool>> editDoctorRecord({
    String doctorID,
    String firstName,
    String lastName,
    String middleInitial,
    String practice,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.editDoctorRecord(
      doctorID: doctorID,
      firstName: firstName,
      lastName: lastName,
      middleInitial: middleInitial,
      practice: practice,
    ));
  }

  @override
  Future<Either<IFailure, Doctor>> retrieveDoctorRecord(
      {String doctorID}) async {
    networkInfo.isConnected;
    return Right(
        await remoteDataSource.retrieveDoctorRecord(doctorID: doctorID));
  }

// Hospital Records Use Cases
  @override
  Future<Either<IFailure, bool>> addHospitalRecord(
      {String hospitalID,
      String name,
      String location,
      String contactNo}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.addHospitalRecord(
      contactNo: contactNo,
      hospitalID: hospitalID,
      location: location,
      name: name,
    ));
  }

  @override
  Future<Either<IFailure, bool>> deleteHospitalRecord(
      {String hospitalID}) async {
    networkInfo.isConnected;
    return Right(
        await remoteDataSource.deleteHospitalRecord(hospitalID: hospitalID));
  }

  @override
  Future<Either<IFailure, bool>> editHospitalRecord(
      {String hospitalID,
      String name,
      String location,
      String contactNo}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.editHospitalRecord(
      contactNo: contactNo,
      hospitalID: hospitalID,
      location: location,
      name: name,
    ));
  }

  @override
  Future<Either<IFailure, Hospital>> retrieveHospitalRecord(
      {String hospitalID}) async {
    networkInfo.isConnected;
    return Right(
        await remoteDataSource.retrieveHospitalRecord(hospitalID: hospitalID));
  }

  // Infant Records Use Cases
  @override
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
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.addInfantRecord(
      birthDate: birthDate,
      birthPlace: birthPlace,
      birthProblems: birthProblems,
      circumferenceAbdominal: circumferenceAbdominal,
      circumferenceChest: circumferenceChest,
      circumferenceHead: circumferenceHead,
      deliveryType: deliveryType,
      distinguishingMarks: distinguishingMarks,
      firstName: firstName,
      gender: gender,
      height: height,
      hospitalID: hospitalID,
      infantID: infantID,
      lastName: lastName,
      middleInitial: middleInitial,
      obstetricianID: obstetricianID,
      parentID: parentID,
      pediatricianID: pediatricianID,
      scoreAPGAR: scoreAPGAR,
      weight: weight,
    ));
  }

  @override
  Future<Either<IFailure, bool>> deleteInfantRecord({String infantID}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.deleteInfantRecord(infantID: infantID));
  }

  @override
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
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.editInfantRecord(
      birthDate: birthDate,
      birthPlace: birthPlace,
      birthProblems: birthProblems,
      circumferenceAbdominal: circumferenceAbdominal,
      circumferenceChest: circumferenceChest,
      circumferenceHead: circumferenceHead,
      deliveryType: deliveryType,
      distinguishingMarks: distinguishingMarks,
      firstName: firstName,
      gender: gender,
      height: height,
      hospitalID: hospitalID,
      infantID: infantID,
      lastName: lastName,
      middleInitial: middleInitial,
      obstetricianID: obstetricianID,
      parentID: parentID,
      pediatricianID: pediatricianID,
      scoreAPGAR: scoreAPGAR,
      weight: weight,
    ));
  }

  @override
  Future<Either<IFailure, Infant>> retrieveInfantRecord(
      {String infantID}) async {
    networkInfo.isConnected;
    return Right(
        await remoteDataSource.retrieveInfantRecord(infantID: infantID));
  }

// Parent Records Use Cases
  @override
  Future<Either<IFailure, bool>> addParentRecord({
    DateTime birthDate,
    String firstName,
    String gender,
    String lastName,
    String middleInitial,
    String parentID,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.addParentRecord(
      birthDate: birthDate,
      firstName: firstName,
      gender: gender,
      lastName: lastName,
      middleInitial: middleInitial,
      parentID: parentID,
    ));
  }

  @override
  Future<Either<IFailure, bool>> deleteParentRecord({String parentID}) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.deleteParentRecord(parentID: parentID));
  }

  @override
  Future<Either<IFailure, bool>> editParentRecord({
    DateTime birthDate,
    String firstName,
    String gender,
    String lastName,
    String middleInitial,
    String parentID,
  }) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.editParentRecord(
      birthDate: birthDate,
      firstName: firstName,
      gender: gender,
      lastName: lastName,
      middleInitial: middleInitial,
      parentID: parentID,
    ));
  }

  @override
  Future<Either<IFailure, Parent>> retrieveParentRecord(
      {String parentID}) async {
    networkInfo.isConnected;
    return Right(
        await remoteDataSource.retrieveParentRecord(parentID: parentID));
  }
}
