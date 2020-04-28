import 'package:bibaw_app/features/app/domain/entities/checkup.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/checkup_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddCheckupRecord usecaseAdd;
  EditCheckupRecord usecaseEdit;
  DeleteCheckupRecord usecaseDelete;
  RetrieveCheckupRecord usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddCheckupRecord(repository: mockIBibawRepository);
    usecaseEdit = EditCheckupRecord(repository: mockIBibawRepository);
    usecaseDelete = DeleteCheckupRecord(repository: mockIBibawRepository);
    usecaseRetrieve = RetrieveCheckupRecord(repository: mockIBibawRepository);
  });

  final tCheckupID = kCheckupID;
  final tInfantID = kInfantID;
  final tDoctorID = kDoctorID;
  final tHospitalID = kHospitalID;

  group('checkup record use cases', () {
    // add checkup record test
    test('should add new checkup record to repository', () async {
      when(mockIBibawRepository.addCheckupRecord(
        infantID: tInfantID,
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(Params(
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.addCheckupRecord(
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit checkup record test
    test('should edit existing checkup record in repository', () async {
      when(mockIBibawRepository.editCheckupRecord(checkupID: tCheckupID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(checkupID: tCheckupID));
      expect(result, Right(true));
      verify(mockIBibawRepository.editCheckupRecord(checkupID: tCheckupID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete checkup record test
    test('should delete existing checkup record in repository', () async {
      when(mockIBibawRepository.deleteCheckupRecord(checkupID: tCheckupID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(checkupID: tCheckupID));
      expect(result, Right(true));
      verify(mockIBibawRepository.deleteCheckupRecord(checkupID: tCheckupID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // retrieve checkup record
    final tCheckup = Checkup(
      checkupID: kCheckupID,
      height: 70.0,
      weight: 20.0,
      date: DateTime.now(),
      circumferenceHead: 33.1,
      medication: 'medication notice',
      problems: 'problems test',
      instructions: 'instructions test',
    );
    test('should retrieve checkup record from repository', () async {
      when(mockIBibawRepository.retrieveCheckupRecord(checkupID: tCheckupID))
          .thenAnswer((_) async => Right(tCheckup));
      final result = await usecaseRetrieve(Params(checkupID: tCheckupID));
      expect(result, Right(tCheckup));
      verify(mockIBibawRepository.retrieveCheckupRecord(checkupID: tCheckupID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
