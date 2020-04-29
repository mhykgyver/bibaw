import 'package:bibaw_app/features/app/domain/entities/checkup.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository_domain_layer.dart';
import 'package:bibaw_app/features/app/domain/usecases/checkup_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddCheckup usecaseAdd;
  EditCheckup usecaseEdit;
  DeleteCheckup usecaseDelete;
  RetrieveCheckup usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddCheckup(repository: mockIBibawRepository);
    usecaseEdit = EditCheckup(repository: mockIBibawRepository);
    usecaseDelete = DeleteCheckup(repository: mockIBibawRepository);
    usecaseRetrieve = RetrieveCheckup(repository: mockIBibawRepository);
  });

  final tCheckupID = kCheckupID;

  group('checkup use cases', () {
    // add checkup test
    test('should add new checkup to repository', () async {
      when(mockIBibawRepository.addCheckup(
        checkupID: tCheckupID,
        circumferenceHead: 33.0,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        height: 80.0,
        instructions: 'test instructions',
        medication: 'test medications',
        problems: 'test problems',
        weight: 30.0,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(Params(
        checkupID: tCheckupID,
        circumferenceHead: 33.0,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        height: 80.0,
        instructions: 'test instructions',
        medication: 'test medications',
        problems: 'test problems',
        weight: 30.0,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.addCheckup(
        checkupID: tCheckupID,
        circumferenceHead: 33.0,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        height: 80.0,
        instructions: 'test instructions',
        medication: 'test medications',
        problems: 'test problems',
        weight: 30.0,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit checkup test
    test('should edit existing checkup in repository', () async {
      when(mockIBibawRepository.editCheckup(
        checkupID: tCheckupID,
        circumferenceHead: 33.0,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        height: 80.0,
        instructions: 'test instructions',
        medication: 'test medications',
        problems: 'test problems',
        weight: 30.0,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(
        checkupID: tCheckupID,
        circumferenceHead: 33.0,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        height: 80.0,
        instructions: 'test instructions',
        medication: 'test medications',
        problems: 'test problems',
        weight: 30.0,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.editCheckup(
        checkupID: tCheckupID,
        circumferenceHead: 33.0,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        height: 80.0,
        instructions: 'test instructions',
        medication: 'test medications',
        problems: 'test problems',
        weight: 30.0,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete checkup test
    test('should delete existing checkup in repository', () async {
      when(mockIBibawRepository.deleteCheckup(checkupID: tCheckupID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(checkupID: tCheckupID));
      expect(result, Right(true));
      verify(mockIBibawRepository.deleteCheckup(checkupID: tCheckupID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // retrieve checkup
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
    test('should retrieve checkup from repository', () async {
      when(mockIBibawRepository.retrieveCheckup(checkupID: tCheckupID))
          .thenAnswer((_) async => Right(tCheckup));
      final result = await usecaseRetrieve(Params(checkupID: tCheckupID));
      expect(result, Right(tCheckup));
      verify(mockIBibawRepository.retrieveCheckup(checkupID: tCheckupID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
