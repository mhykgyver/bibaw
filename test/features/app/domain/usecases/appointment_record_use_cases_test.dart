import 'package:bibaw_app/features/app/domain/entities/appointment.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository_domain_layer.dart';
import 'package:bibaw_app/features/app/domain/usecases/appointment_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockIBibawRepository extends Mock implements IBibawRepository {}

void main() {
  MockIBibawRepository mockIBibawRepository;
  AddAppointment usecaseAdd;
  EditAppointment usecaseEdit;
  DeleteAppointment usecaseDelete;
  RetrieveAppointment usecaseRetrieve;

  setUp(() {
    mockIBibawRepository = MockIBibawRepository();
    usecaseAdd = AddAppointment(repository: mockIBibawRepository);
    usecaseEdit = EditAppointment(repository: mockIBibawRepository);
    usecaseDelete = DeleteAppointment(repository: mockIBibawRepository);
    usecaseRetrieve = RetrieveAppointment(repository: mockIBibawRepository);
  });

  final tAppointmentID = kAppointmentID;
  final tInfantID = kInfantID;
  final tDoctorID = kDoctorID;
  final tHospitalID = kHospitalID;

  group('appointment record use cases', () {
    // add appointment record test
    test('should add new appointment record to repository', () async {
      when(mockIBibawRepository.addAppointment(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        description: "test description",
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseAdd(Params(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        description: "test description",
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.addAppointment(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        description: "test description",
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Edit appointment record test
    test('should edit existing appointment record in repository', () async {
      when(mockIBibawRepository.editAppointment(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        description: "test description",
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      )).thenAnswer((_) async => Right(true));
      final result = await usecaseEdit(Params(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        description: "test description",
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      ));
      expect(result, Right(true));
      verify(mockIBibawRepository.editAppointment(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04Z"),
        description: "test description",
        doctorID: tDoctorID,
        hospitalID: tHospitalID,
        infantID: tInfantID,
      ));
      verifyNoMoreInteractions(mockIBibawRepository);
    });

    // Delete appointment record test
    test('should delete existing appointment record in repository', () async {
      when(mockIBibawRepository.deleteAppointment(
              appointmentID: tAppointmentID))
          .thenAnswer((_) async => Right(true));
      final result = await usecaseDelete(Params(appointmentID: tAppointmentID));
      expect(result, Right(true));
      verify(mockIBibawRepository.deleteAppointment(
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
      when(mockIBibawRepository.retrieveAppointment(
              appointmentID: tAppointmentID))
          .thenAnswer((_) async => Right(tAppointment));
      final result =
          await usecaseRetrieve(Params(appointmentID: tAppointmentID));
      expect(result, Right(tAppointment));
      verify(mockIBibawRepository.retrieveAppointment(
          appointmentID: tAppointmentID));
      verifyNoMoreInteractions(mockIBibawRepository);
    });
  });
}
