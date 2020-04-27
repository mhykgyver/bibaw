import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/entities/checkup.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/checkup_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  MockBibawRepository mockBibawRepository;
  AddCheckupRecord usecaseAdd;
  EditCheckupRecord usecaseEdit;
  DeleteCheckupRecord usecaseDelete;
  RetrieveCheckupRecord usecaseRetrieve;

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecaseAdd = AddCheckupRecord(repository: mockBibawRepository);
    usecaseEdit = EditCheckupRecord(repository: mockBibawRepository);
    usecaseDelete = DeleteCheckupRecord(repository: mockBibawRepository);
    usecaseRetrieve = RetrieveCheckupRecord(repository: mockBibawRepository);
  });

  final tCheckupID = kCheckupID;

  group('checkup record use cases', () {
    // add checkup record test
    test('should add new checkup record to repository', () async {
      when(mockBibawRepository.addCheckupRecord())
          .thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(NoParams());
      expect(result, Right(true));
      verify(mockBibawRepository.addCheckupRecord());
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Edit checkup record test
    test('should edit existing checkup record in repository', () async {
      when(mockBibawRepository.editCheckupRecord(checkupID: tCheckupID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(checkupID: tCheckupID));
      expect(result, Right(true));
      verify(mockBibawRepository.editCheckupRecord(checkupID: tCheckupID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Delete checkup record test
    test('should delete existing checkup record in repository', () async {
      when(mockBibawRepository.deleteCheckupRecord(checkupID: tCheckupID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(checkupID: tCheckupID));
      expect(result, Right(true));
      verify(mockBibawRepository.deleteCheckupRecord(checkupID: tCheckupID));
      verifyNoMoreInteractions(mockBibawRepository);
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
      when(mockBibawRepository.retrieveCheckupRecord(checkupID: tCheckupID))
          .thenAnswer((_) async => Right(tCheckup));
      final result = await usecaseRetrieve(Params(checkupID: tCheckupID));
      expect(result, Right(tCheckup));
      verify(mockBibawRepository.retrieveCheckupRecord(checkupID: tCheckupID));
      verifyNoMoreInteractions(mockBibawRepository);
    });
  });
}
