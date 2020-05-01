import 'package:bibaw_app/features/app/domain/entities/doctor_hospital.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository_domain_layer.dart';
import 'package:bibaw_app/features/app/domain/usecases/doctor_hospital_use_cases.dart';
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

  group('doctorHospital record use cases', () {
    // add doctorHospital record test
    test('should add new doctorHospital record to repository', () async {
      when(mockIBibawRepository.addDoctorHospitalRecord(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(Params(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.addDoctorHospitalRecord(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit doctorHospital record test
    test('should edit existing doctorHospital record in repository', () async {
      when(mockIBibawRepository.editDoctorHospitalRecord(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.editDoctorHospitalRecord(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete doctorHospital record test
    test('should delete existing doctorHospital record in repository',
        () async {
      when(mockIBibawRepository.deleteDoctorHospitalRecord(doctorID: kDoctorID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(doctorID: kDoctorID));
      expect(result, Right(true));
      verify(
          mockIBibawRepository.deleteDoctorHospitalRecord(doctorID: kDoctorID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // retrieve doctorHospital record
    final tDoctorHospital = DoctorHospital(
      doctorID: kDoctorID,
      hospitalID: kHospitalID,
      consultationDaysHours: "M10-12/M14-16",
      contactNo: '123456789',
      roomNo: '123',
    );
    test('should retrieve doctorHospital record from repository', () async {
      when(mockIBibawRepository.retrieveDoctorHospitalRecord(
              doctorID: kDoctorID))
          .thenAnswer((_) async => Right(tDoctorHospital));
      final result = await usecaseRetrieve(Params(doctorID: kDoctorID));
      expect(result, Right(tDoctorHospital));
      verify(mockIBibawRepository.retrieveDoctorHospitalRecord(
          doctorID: kDoctorID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
