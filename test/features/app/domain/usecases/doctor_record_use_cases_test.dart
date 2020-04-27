import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/doctor_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  MockBibawRepository mockBibawRepository;
  AddDoctorRecord usecaseAdd;
  EditDoctorRecord usecaseEdit;
  DeleteDoctorRecord usecaseDelete;
  RetrieveDoctorRecord usecaseRetrieve;

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecaseAdd = AddDoctorRecord(repository: mockBibawRepository);
    usecaseEdit = EditDoctorRecord(repository: mockBibawRepository);
    usecaseDelete = DeleteDoctorRecord(repository: mockBibawRepository);
    usecaseRetrieve = RetrieveDoctorRecord(repository: mockBibawRepository);
  });

  final tDoctorID = kDoctorID;

  group('doctor record use cases', () {
    // add doctor record test
    test('should add new doctor record to repository', () async {
      when(mockBibawRepository.addDoctorRecord())
          .thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(NoParams());
      expect(result, Right(true));
      verify(mockBibawRepository.addDoctorRecord());
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Edit doctor record test
    test('should edit existing doctor record in repository', () async {
      when(mockBibawRepository.editDoctorRecord(doctorID: tDoctorID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(doctorID: tDoctorID));
      expect(result, Right(true));
      verify(mockBibawRepository.editDoctorRecord(doctorID: tDoctorID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // Delete doctor record test
    test('should delete existing doctor record in repository', () async {
      when(mockBibawRepository.deleteDoctorRecord(doctorID: tDoctorID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(doctorID: tDoctorID));
      expect(result, Right(true));
      verify(mockBibawRepository.deleteDoctorRecord(doctorID: tDoctorID));
      verifyNoMoreInteractions(mockBibawRepository);
    });

    // retrieve doctor record
    final tDoctor = Doctor(
      doctorID: kDoctorID,
      firstName: 'Doctor',
      lastName: 'OB',
      practice: 'Obstetrician',
    );
    test('should retrieve doctor record from repository', () async {
      when(mockBibawRepository.retrieveDoctorRecord(doctorID: tDoctorID))
          .thenAnswer((_) async => Right(tDoctor));
      final result = await usecaseRetrieve(Params(doctorID: tDoctorID));
      expect(result, Right(tDoctor));
      verify(mockBibawRepository.retrieveDoctorRecord(doctorID: tDoctorID));
      verifyNoMoreInteractions(mockBibawRepository);
    });
  });
}
