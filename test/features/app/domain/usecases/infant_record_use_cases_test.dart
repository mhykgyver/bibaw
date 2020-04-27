import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/entities/infant.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/infant_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  MockBibawRepository mockBibawRepository;
  AddInfantRecord usecaseAdd;
  EditInfantRecord usecaseEdit;
  DeleteInfantRecord usecaseDelete;
  RetrieveInfantRecord usecaseRetrieve;

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecaseAdd = AddInfantRecord(repository: mockBibawRepository);
    usecaseEdit = EditInfantRecord(repository: mockBibawRepository);
    usecaseDelete = DeleteInfantRecord(repository: mockBibawRepository);
    usecaseRetrieve = RetrieveInfantRecord(repository: mockBibawRepository);
  });

  final tInfantID = kInfantID;

  group('infant record use cases', () {
    // add infant record test
    test('should add new infant record to repository', () async {
      when(mockBibawRepository.addInfantRecord())
          .thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(NoParams());
      expect(result, Right(true));
      verify(mockBibawRepository.addInfantRecord());
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Edit infant record test
    test('should edit existing infant record in repository', () async {
      when(mockBibawRepository.editInfantRecord(infantID: tInfantID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(infantID: tInfantID));
      expect(result, Right(true));
      verify(mockBibawRepository.editInfantRecord(infantID: tInfantID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Delete infant record test
    test('should delete existing infant record in repository', () async {
      when(mockBibawRepository.deleteInfantRecord(infantID: tInfantID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(infantID: tInfantID));
      expect(result, Right(true));
      verify(mockBibawRepository.deleteInfantRecord(infantID: tInfantID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // retrieve infant record
    final tInfant = Infant(
        infantID: kInfantID,
        firstName: 'Baby',
        lastName: 'Girl',
        gender: 'F',
        height: 70.0,
        weight: 20.0,
        birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
        circumferenceHead: 33.1,
        parentID: kParentID);
    test('should retrieve infant record from repository', () async {
      when(mockBibawRepository.retrieveInfantRecord(infantID: tInfantID))
          .thenAnswer((_) async => Right(tInfant));
      final result = await usecaseRetrieve(Params(infantID: tInfantID));
      expect(result, Right(tInfant));
      verify(mockBibawRepository.retrieveInfantRecord(infantID: tInfantID));
      verifyNoMoreInteractions(mockBibawRepository);
    });
  });
}
