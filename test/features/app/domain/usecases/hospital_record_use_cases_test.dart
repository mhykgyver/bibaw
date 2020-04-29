import 'package:bibaw_app/features/app/domain/entities/hospital.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/hospital_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddHospitalRecord usecaseAdd;
  EditHospitalRecord usecaseEdit;
  DeleteHospitalRecord usecaseDelete;
  RetrieveHospitalRecord usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddHospitalRecord(repository: mockIBibawRepository);
    usecaseEdit = EditHospitalRecord(repository: mockIBibawRepository);
    usecaseDelete = DeleteHospitalRecord(repository: mockIBibawRepository);
    usecaseRetrieve = RetrieveHospitalRecord(repository: mockIBibawRepository);
  });

  final tHospitalID = kHospitalID;

  group('hospital record use cases', () {
    // add hospital record test
    test('should add new hospital record to repository', () async {
      when(mockIBibawRepository.addHospitalRecord(
        contactNo: '1234567',
        hospitalID: tHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(Params(
        contactNo: '1234567',
        hospitalID: tHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.addHospitalRecord(
        contactNo: '1234567',
        hospitalID: tHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit hospital record test
    test('should edit existing hospital record in repository', () async {
      when(mockIBibawRepository.editHospitalRecord(
        contactNo: '1234567',
        hospitalID: tHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(
        contactNo: '1234567',
        hospitalID: tHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.editHospitalRecord(
        contactNo: '1234567',
        hospitalID: tHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete hospital record test
    test('should delete existing hospital record in repository', () async {
      when(mockIBibawRepository.deleteHospitalRecord(hospitalID: tHospitalID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(hospitalID: tHospitalID));
      expect(result, Right(true));
      verify(
          mockIBibawRepository.deleteHospitalRecord(hospitalID: tHospitalID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // retrieve hospital record
    final tHospital = Hospital(
      hospitalID: kHospitalID,
      location: 'Alabang',
      name: 'Asian Medical Center',
      contactNo: '123456789',
    );
    test('should retrieve hospital record from repository', () async {
      when(mockIBibawRepository.retrieveHospitalRecord(hospitalID: tHospitalID))
          .thenAnswer((_) async => Right(tHospital));
      final result = await usecaseRetrieve(Params(hospitalID: tHospitalID));
      expect(result, Right(tHospital));
      verify(
          mockIBibawRepository.retrieveHospitalRecord(hospitalID: tHospitalID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
