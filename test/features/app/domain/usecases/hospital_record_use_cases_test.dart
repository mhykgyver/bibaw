import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/entities/hospital.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/hospital_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  MockBibawRepository mockBibawRepository;
  AddHospitalRecord usecaseAdd;
  EditHospitalRecord usecaseEdit;
  DeleteHospitalRecord usecaseDelete;
  RetrieveHospitalRecord usecaseRetrieve;

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecaseAdd = AddHospitalRecord(repository: mockBibawRepository);
    usecaseEdit = EditHospitalRecord(repository: mockBibawRepository);
    usecaseDelete = DeleteHospitalRecord(repository: mockBibawRepository);
    usecaseRetrieve = RetrieveHospitalRecord(repository: mockBibawRepository);
  });

  final tHospitalID = kHospitalID;

  group('hospital record use cases', () {
    // add hospital record test
    test('should add new hospital record to repository', () async {
      when(mockBibawRepository.addHospitalRecord())
          .thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(NoParams());
      expect(result, Right(true));
      verify(mockBibawRepository.addHospitalRecord());
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Edit hospital record test
    test('should edit existing hospital record in repository', () async {
      when(mockBibawRepository.editHospitalRecord(hospitalID: tHospitalID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(hospitalID: tHospitalID));
      expect(result, Right(true));
      verify(mockBibawRepository.editHospitalRecord(hospitalID: tHospitalID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Delete hospital record test
    test('should delete existing hospital record in repository', () async {
      when(mockBibawRepository.deleteHospitalRecord(hospitalID: tHospitalID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(hospitalID: tHospitalID));
      expect(result, Right(true));
      verify(mockBibawRepository.deleteHospitalRecord(hospitalID: tHospitalID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // retrieve hospital record
    final tHospital = Hospital(
      hospitalID: kHospitalID,
      location: 'Alabang',
      name: 'Asian Medical Center',
      room: '721',
    );
    test('should retrieve hospital record from repository', () async {
      when(mockBibawRepository.retrieveHospitalRecord(hospitalID: tHospitalID))
          .thenAnswer((_) async => Right(tHospital));
      final result = await usecaseRetrieve(Params(hospitalID: tHospitalID));
      expect(result, Right(tHospital));
      verify(
          mockBibawRepository.retrieveHospitalRecord(hospitalID: tHospitalID));
      verifyNoMoreInteractions(mockBibawRepository);
    });
  });
}
