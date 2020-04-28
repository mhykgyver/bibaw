import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/doctor_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddDoctorRecord usecaseAdd;
  EditDoctorRecord usecaseEdit;
  DeleteDoctorRecord usecaseDelete;
  RetrieveDoctorRecord usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddDoctorRecord(repository: mockIBibawRepository);
    usecaseEdit = EditDoctorRecord(repository: mockIBibawRepository);
    usecaseDelete = DeleteDoctorRecord(repository: mockIBibawRepository);
    usecaseRetrieve = RetrieveDoctorRecord(repository: mockIBibawRepository);
  });

  final tDoctorID = kDoctorID;

  group('doctor record use cases', () {
    // add doctor record test
    test('should add new doctor record to repository', () async {
      when(mockIBibawRepository.addDoctorRecord())
          .thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(NoParams());
      expect(result, Right(true));
      verify(mockIBibawRepository.addDoctorRecord());
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit doctor record test
    test('should edit existing doctor record in repository', () async {
      when(mockIBibawRepository.editDoctorRecord(doctorID: tDoctorID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(doctorID: tDoctorID));
      expect(result, Right(true));
      verify(mockIBibawRepository.editDoctorRecord(doctorID: tDoctorID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete doctor record test
    test('should delete existing doctor record in repository', () async {
      when(mockIBibawRepository.deleteDoctorRecord(doctorID: tDoctorID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(doctorID: tDoctorID));
      expect(result, Right(true));
      verify(mockIBibawRepository.deleteDoctorRecord(doctorID: tDoctorID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // retrieve doctor record
    final tDoctor = Doctor(
      doctorID: kDoctorID,
      firstName: 'Doctor',
      lastName: 'OB',
      practice: 'Obstetrician',
    );
    test('should retrieve doctor record from repository', () async {
      when(mockIBibawRepository.retrieveDoctorRecord(doctorID: tDoctorID))
          .thenAnswer((_) async => Right(tDoctor));
      final result = await usecaseRetrieve(Params(doctorID: tDoctorID));
      expect(result, Right(tDoctor));
      verify(mockIBibawRepository.retrieveDoctorRecord(doctorID: tDoctorID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
