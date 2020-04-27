import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/entities/parent.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/parent_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  MockBibawRepository mockBibawRepository;
  AddParentRecord usecaseAdd;
  EditParentRecord usecaseEdit;
  DeleteParentRecord usecaseDelete;
  RetrieveParentRecord usecaseRetrieve;

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecaseAdd = AddParentRecord(repository: mockBibawRepository);
    usecaseEdit = EditParentRecord(repository: mockBibawRepository);
    usecaseDelete = DeleteParentRecord(repository: mockBibawRepository);
    usecaseRetrieve = RetrieveParentRecord(repository: mockBibawRepository);
  });

  final tParentID = kParentID;

  group('parent record use cases', () {
    // add parent record test
    test('should add new parent record to repository', () async {
      when(mockBibawRepository.addParentRecord())
          .thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(NoParams());
      expect(result, Right(true));
      verify(mockBibawRepository.addParentRecord());
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Edit parent record test
    test('should edit existing parent record in repository', () async {
      when(mockBibawRepository.editParentRecord(parentID: tParentID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(parentID: tParentID));
      expect(result, Right(true));
      verify(mockBibawRepository.editParentRecord(parentID: tParentID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Delete parent record test
    test('should delete existing parent record in repository', () async {
      when(mockBibawRepository.deleteParentRecord(parentID: tParentID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(parentID: tParentID));
      expect(result, Right(true));
      verify(mockBibawRepository.deleteParentRecord(parentID: tParentID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // retrieve parent record
    final tParent = Parent(
      parentID: kParentID,
      firstName: 'Mommy',
      lastName: 'Parent',
      birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
    );
    test('should retrieve parent record from repository', () async {
      when(mockBibawRepository.retrieveParentRecord(parentID: tParentID))
          .thenAnswer((_) async => Right(tParent));
      final result = await usecaseRetrieve(Params(parentID: tParentID));
      expect(result, Right(tParent));
      verify(mockBibawRepository.retrieveParentRecord(parentID: tParentID));
      verifyNoMoreInteractions(mockBibawRepository);
    });
  });
}
