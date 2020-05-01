import 'package:bibaw_app/features/app/domain/entities/infant.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository_domain_layer.dart';
import 'package:bibaw_app/features/app/domain/usecases/infant_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddInfantRecord usecaseAdd;
  EditInfantRecord usecaseEdit;
  DeleteInfantRecord usecaseDelete;
  RetrieveInfantRecord usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddInfantRecord(repository: mockIBibawRepository);
    usecaseEdit = EditInfantRecord(repository: mockIBibawRepository);
    usecaseDelete = DeleteInfantRecord(repository: mockIBibawRepository);
    usecaseRetrieve = RetrieveInfantRecord(repository: mockIBibawRepository);
  });

  group('infant record use cases', () {
    // add infant record test
    test('should add new infant record to repository', () async {
      when(mockIBibawRepository.addInfantRecord(
        infantID: kInfantID,
        firstName: 'Baby',
        lastName: 'Girl',
        middleInitial: 'G',
        gender: 'F',
        birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
        birthPlace: 'Test Birth Place',
        weight: 33.0,
        height: 80.0,
        circumferenceHead: 20.0,
        circumferenceChest: 25.0,
        circumferenceAbdominal: 22.0,
        scoreAPGAR: '9,9',
        birthProblems: 'test problems',
        distinguishingMarks: 'test marks',
        deliveryType: 'CS',
        parentID: kParentID,
        obstetricianID: kDoctorID,
        pediatricianID: kDoctorID,
        hospitalID: kHospitalID,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(Params(
        infantID: kInfantID,
        firstName: 'Baby',
        lastName: 'Girl',
        middleInitial: 'G',
        gender: 'F',
        birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
        birthPlace: 'Test Birth Place',
        weight: 33.0,
        height: 80.0,
        circumferenceHead: 20.0,
        circumferenceChest: 25.0,
        circumferenceAbdominal: 22.0,
        scoreAPGAR: '9,9',
        birthProblems: 'test problems',
        distinguishingMarks: 'test marks',
        deliveryType: 'CS',
        parentID: kParentID,
        obstetricianID: kDoctorID,
        pediatricianID: kDoctorID,
        hospitalID: kHospitalID,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.addInfantRecord(
        infantID: kInfantID,
        firstName: 'Baby',
        lastName: 'Girl',
        middleInitial: 'G',
        gender: 'F',
        birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
        birthPlace: 'Test Birth Place',
        weight: 33.0,
        height: 80.0,
        circumferenceHead: 20.0,
        circumferenceChest: 25.0,
        circumferenceAbdominal: 22.0,
        scoreAPGAR: '9,9',
        birthProblems: 'test problems',
        distinguishingMarks: 'test marks',
        deliveryType: 'CS',
        parentID: kParentID,
        obstetricianID: kDoctorID,
        pediatricianID: kDoctorID,
        hospitalID: kHospitalID,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit infant record test
    test('should edit existing infant record in repository', () async {
      when(mockIBibawRepository.editInfantRecord(
        infantID: kInfantID,
        firstName: 'Baby',
        lastName: 'Girl',
        middleInitial: 'G',
        gender: 'F',
        birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
        birthPlace: 'Test Birth Place',
        weight: 33.0,
        height: 80.0,
        circumferenceHead: 20.0,
        circumferenceChest: 25.0,
        circumferenceAbdominal: 22.0,
        scoreAPGAR: '9,9',
        birthProblems: 'test problems',
        distinguishingMarks: 'test marks',
        deliveryType: 'CS',
        parentID: kParentID,
        obstetricianID: kDoctorID,
        pediatricianID: kDoctorID,
        hospitalID: kHospitalID,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(
        infantID: kInfantID,
        firstName: 'Baby',
        lastName: 'Girl',
        middleInitial: 'G',
        gender: 'F',
        birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
        birthPlace: 'Test Birth Place',
        weight: 33.0,
        height: 80.0,
        circumferenceHead: 20.0,
        circumferenceChest: 25.0,
        circumferenceAbdominal: 22.0,
        scoreAPGAR: '9,9',
        birthProblems: 'test problems',
        distinguishingMarks: 'test marks',
        deliveryType: 'CS',
        parentID: kParentID,
        obstetricianID: kDoctorID,
        pediatricianID: kDoctorID,
        hospitalID: kHospitalID,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.editInfantRecord(
        infantID: kInfantID,
        firstName: 'Baby',
        lastName: 'Girl',
        middleInitial: 'G',
        gender: 'F',
        birthDate: DateTime.parse("2017-12-05 20:18:04Z"),
        birthPlace: 'Test Birth Place',
        weight: 33.0,
        height: 80.0,
        circumferenceHead: 20.0,
        circumferenceChest: 25.0,
        circumferenceAbdominal: 22.0,
        scoreAPGAR: '9,9',
        birthProblems: 'test problems',
        distinguishingMarks: 'test marks',
        deliveryType: 'CS',
        parentID: kParentID,
        obstetricianID: kDoctorID,
        pediatricianID: kDoctorID,
        hospitalID: kHospitalID,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete infant record test
    test('should delete existing infant record in repository', () async {
      when(mockIBibawRepository.deleteInfantRecord(infantID: kInfantID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(infantID: kInfantID));
      expect(result, Right(true));
      verify(mockIBibawRepository.deleteInfantRecord(infantID: kInfantID));
      verifyNoMoreInteractions(mockIBibawRepository);
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
      when(mockIBibawRepository.retrieveInfantRecord(infantID: kInfantID))
          .thenAnswer((_) async => Right(tInfant));
      final result = await usecaseRetrieve(Params(infantID: kInfantID));
      expect(result, Right(tInfant));
      verify(mockIBibawRepository.retrieveInfantRecord(infantID: kInfantID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
