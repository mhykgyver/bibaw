import 'package:bibaw_app/features/app/domain/entities/appointment.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/appointment_record_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddAppointmentRecord usecaseAdd;
  EditAppointmentRecord usecaseEdit;
  DeleteAppointmentRecord usecaseDelete;
  RetrieveAppointmentRecord usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddAppointmentRecord(repository: mockIBibawRepository);
    usecaseEdit = EditAppointmentRecord(repository: mockIBibawRepository);
    usecaseDelete = DeleteAppointmentRecord(repository: mockIBibawRepository);
    usecaseRetrieve =
        RetrieveAppointmentRecord(repository: mockIBibawRepository);
  });

  final tAppointmentID = kAppointmentID;
  final tInfantID = kInfantID;
  final tDoctorID = kDoctorID;
  final tHospitalID = kHospitalID;

  group('appointment record use cases', () {
    // add appointment record test
    test('should add new appointment record to repository', () async {
      when(mockIBibawRepository.addAppointmentRecord(
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
      verify(mockIBibawRepository.addAppointmentRecord(
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit appointment record test
    test('should edit existing appointment record in repository', () async {
      when(mockIBibawRepository.editAppointmentRecord(
              appointmentID: tAppointmentID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(appointmentID: tAppointmentID));
      expect(result, Right(true));
      verify(mockIBibawRepository.editAppointmentRecord(
          appointmentID: tAppointmentID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete appointment record test
    test('should delete existing appointment record in repository', () async {
      when(mockIBibawRepository.deleteAppointmentRecord(
              appointmentID: tAppointmentID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(appointmentID: tAppointmentID));
      expect(result, Right(true));
      verify(mockIBibawRepository.deleteAppointmentRecord(
          appointmentID: tAppointmentID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // retrieve appointment record
    final tAppointment = Appointment(
      appointmentID: kAppointmentID,
      date: DateTime.now(),
      description: 'test description',
      doctorID: kDoctorID,
      hospitalID: kHospitalID,
      infantID: kInfantID,
    );
    test('should retrieve appointment record from repository', () async {
      when(mockIBibawRepository.retrieveAppointmentRecord(
              appointmentID: tAppointmentID))
          .thenAnswer((_) async => Right(tAppointment));
      final result =
          await usecaseRetrieve(Params(appointmentID: tAppointmentID));
      expect(result, Right(tAppointment));
      verify(mockIBibawRepository.retrieveAppointmentRecord(
          appointmentID: tAppointmentID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
