import 'package:bibaw_app/features/app/domain/entities/doctor_hospital.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/doctor_hospital_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddDoctorHospitalRecord usecaseAdd;
  EditDoctorHospitalRecord usecaseEdit;
  DeleteDoctorHospitalRecord usecaseDelete;
  RetrieveDoctorHospitalRecord usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddDoctorHospitalRecord(repository: mockIBibawRepository);
    usecaseEdit = EditDoctorHospitalRecord(repository: mockIBibawRepository);
    usecaseDelete =
        DeleteDoctorHospitalRecord(repository: mockIBibawRepository);
    usecaseRetrieve =
        RetrieveDoctorHospitalRecord(repository: mockIBibawRepository);
  });

  final tDoctorID = kDoctorID;
  final tHospitalID = kHospitalID;

  group('doctorHospital record use cases', () {
    // add doctorHospital record test
    test('should add new doctorHospital record to repository', () async {
      when(mockIBibawRepository.addDoctorHospitalRecord(
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(Params(
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.addDoctorHospitalRecord(
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit doctorHospital record test
    test('should edit existing doctorHospital record in repository', () async {
      when(mockIBibawRepository.editDoctorHospitalRecord(doctorID: tDoctorID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(doctorID: tDoctorID));
      expect(result, Right(true));
      verify(
          mockIBibawRepository.editDoctorHospitalRecord(doctorID: tDoctorID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete doctorHospital record test
    test('should delete existing doctorHospital record in repository',
        () async {
      when(mockIBibawRepository.deleteDoctorHospitalRecord(doctorID: tDoctorID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(doctorID: tDoctorID));
      expect(result, Right(true));
      verify(
          mockIBibawRepository.deleteDoctorHospitalRecord(doctorID: tDoctorID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // retrieve doctorHospital record
    final tDoctorHospital = DoctorHospital(
      doctorID: kDoctorID,
      hospitalID: tHospitalID,
      consultationDaysHours: "M10-12/M14-16",
      contactNo: '123456789',
    );
    test('should retrieve doctorHospital record from repository', () async {
      when(mockIBibawRepository.retrieveDoctorHospitalRecord(
              doctorID: tDoctorID))
          .thenAnswer((_) async => Right(tDoctorHospital));
      final result = await usecaseRetrieve(Params(doctorID: tDoctorID));
      expect(result, Right(tDoctorHospital));
      verify(mockIBibawRepository.retrieveDoctorHospitalRecord(
          doctorID: tDoctorID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
