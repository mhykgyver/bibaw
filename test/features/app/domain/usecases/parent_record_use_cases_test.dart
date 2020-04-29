import 'package:bibaw_app/features/app/domain/entities/parent.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/parent_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddParentRecord usecaseAdd;
  EditParentRecord usecaseEdit;
  DeleteParentRecord usecaseDelete;
  RetrieveParentRecord usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddParentRecord(repository: mockIBibawRepository);
    usecaseEdit = EditParentRecord(repository: mockIBibawRepository);
    usecaseDelete = DeleteParentRecord(repository: mockIBibawRepository);
    usecaseRetrieve = RetrieveParentRecord(repository: mockIBibawRepository);
  });

  final tParentID = kParentID;

  group('parent record use cases', () {
    // add parent record test
    test('should add new parent record to repository', () async {
      when(mockIBibawRepository.addParentRecord(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: tParentID,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(Params(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: tParentID,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.addParentRecord(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: tParentID,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit parent record test
    test('should edit existing parent record in repository', () async {
      when(mockIBibawRepository.editParentRecord(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: tParentID,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: tParentID,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.editParentRecord(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: tParentID,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete parent record test
    test('should delete existing parent record in repository', () async {
      when(mockIBibawRepository.deleteParentRecord(parentID: tParentID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(parentID: tParentID));
      expect(result, Right(true));
      verify(mockIBibawRepository.deleteParentRecord(parentID: tParentID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // retrieve parent record
    final tParent = Parent(
      birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
      firstName: 'Mommy',
      gender: 'F',
      lastName: 'Parent',
      middleInitial: 'P',
      parentID: tParentID,
    );
    test('should retrieve parent record from repository', () async {
      when(mockIBibawRepository.retrieveParentRecord(parentID: tParentID))
          .thenAnswer((_) async => Right(tParent));
      final result = await usecaseRetrieve(Params(parentID: tParentID));
      expect(result, Right(tParent));
      verify(mockIBibawRepository.retrieveParentRecord(parentID: tParentID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
