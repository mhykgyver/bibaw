import 'package:bibaw_app/core/network/network_info.dart';
import 'package:bibaw_app/features/app/data/datasources/bibaw_local_data_source.dart';
import 'package:bibaw_app/features/app/data/datasources/bibaw_remote_data_source.dart';
import 'package:bibaw_app/features/app/data/models/appointment_model.dart';
import 'package:bibaw_app/features/app/data/models/checkup_model.dart';
import 'package:bibaw_app/features/app/data/models/doctor_hospital_model.dart';
import 'package:bibaw_app/features/app/data/models/doctor_model.dart';
import 'package:bibaw_app/features/app/data/models/hospital_model.dart';
import 'package:bibaw_app/features/app/data/models/infant_model.dart';
import 'package:bibaw_app/features/app/data/models/parent_model.dart';
import 'package:bibaw_app/features/app/data/repositories/bibaw_repository_impl.dart';
import 'package:bibaw_app/features/app/domain/entities/appointment.dart';
import 'package:bibaw_app/features/app/domain/entities/checkup.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor.dart';
import 'package:bibaw_app/features/app/domain/entities/doctor_hospital.dart';
import 'package:bibaw_app/features/app/domain/entities/hospital.dart';
import 'package:bibaw_app/features/app/domain/entities/infant.dart';
import 'package:bibaw_app/features/app/domain/entities/parent.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockRemoteDataSource extends Mock implements IBibawRemoteDataSource {}

class MockLocalDataSource extends Mock implements IBibawLocalDataSource {}

class MockNetworkInfo extends Mock implements INetworkInfo {}

void main() {
  BibawRepositoryImpl _repository;
  MockRemoteDataSource _mockRemoteDataSource;
  MockLocalDataSource _mockLocalDataSource;
  MockNetworkInfo _mockNetworkInfo;

  setUp(() {
    _mockRemoteDataSource = MockRemoteDataSource();
    _mockLocalDataSource = MockLocalDataSource();
    _mockNetworkInfo = MockNetworkInfo();
    _repository = BibawRepositoryImpl(
        remoteDataSource: _mockRemoteDataSource,
        localDataSource: _mockLocalDataSource,
        networkInfo: _mockNetworkInfo);
  });

  group('device online and appointment records use cases tests:', () {
    final _tAppointmentModel = AppointmentModel(
      appointmentID: kAppointmentID,
      date: DateTime.parse("2020-12-05 20:18:04.000Z"),
      description: "test description",
      doctorID: kDoctorID,
      hospitalID: kHospitalID,
      infantID: kInfantID,
    );
    final Appointment _tAppointment = _tAppointmentModel;

    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('add new appointment record', () async {
      when(_mockRemoteDataSource.addAppointment(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04.000Z"),
        description: "test description",
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        infantID: kInfantID,
      )).thenAnswer((_) async => true);
      final _result = await _repository.addAppointment(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04.000Z"),
        description: "test description",
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        infantID: kInfantID,
      );
      expect(_result, equals(Right(true)));
    });

    test('edit appointment record', () async {
      when(_mockRemoteDataSource.editAppointment(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04.000Z"),
        description: "test description",
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        infantID: kInfantID,
      )).thenAnswer((_) async => true);
      final result = await _repository.editAppointment(
        appointmentID: kAppointmentID,
        date: DateTime.parse("2020-12-05 20:18:04.000Z"),
        description: "test description",
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        infantID: kInfantID,
      );
      expect(result, equals(Right(true)));
    });

    test('delete appointment record', () async {
      when(_mockRemoteDataSource.deleteAppointment(
              appointmentID: kAppointmentID))
          .thenAnswer((_) async => true);
      final result =
          await _repository.deleteAppointment(appointmentID: kAppointmentID);
      expect(result, equals(Right(true)));
    });

    test('retrieve appointment record', () async {
      when(_mockRemoteDataSource.retrieveAppointment(
              appointmentID: kAppointmentID))
          .thenAnswer((_) async => _tAppointmentModel);
      final result =
          await _repository.retrieveAppointment(appointmentID: kAppointmentID);
      expect(result, equals(Right(_tAppointment)));
    });
  });

  group('device online and checkup records use cases tests:', () {
    final _tCheckupModel = CheckupModel(
      checkupID: kCheckupID,
      circumferenceHead: 33.1,
      date: DateTime.parse("2020-12-05 20:18:04.000Z"),
      height: 70.0,
      instructions: 'instructions test',
      medication: 'medication notice',
      problems: 'problems test',
      weight: 20.0,
    );
    final Checkup _tCheckup = _tCheckupModel;

    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('add new checkup record', () async {
      when(_mockRemoteDataSource.addCheckup(
        checkupID: kCheckupID,
        circumferenceHead: 33.1,
        date: DateTime.parse("2020-12-05 20:18:04.000Z"),
        height: 70.0,
        instructions: 'instructions test',
        medication: 'medication notice',
        problems: 'problems test',
        weight: 20.0,
      )).thenAnswer((_) async => true);
      final result = await _repository.addCheckup(
        checkupID: kCheckupID,
        circumferenceHead: 33.1,
        date: DateTime.parse("2020-12-05 20:18:04.000Z"),
        height: 70.0,
        instructions: 'instructions test',
        medication: 'medication notice',
        problems: 'problems test',
        weight: 20.0,
      );
      expect(result, equals(Right(true)));
    });

    test('edit checkup record', () async {
      when(_mockRemoteDataSource.editCheckup(
        checkupID: kCheckupID,
        circumferenceHead: 33.1,
        date: DateTime.parse("2020-12-05 20:18:04.000Z"),
        height: 70.0,
        instructions: 'instructions test',
        medication: 'medication notice',
        problems: 'problems test',
        weight: 20.0,
      )).thenAnswer((_) async => true);
      final result = await _repository.editCheckup(
        checkupID: kCheckupID,
        circumferenceHead: 33.1,
        date: DateTime.parse("2020-12-05 20:18:04.000Z"),
        height: 70.0,
        instructions: 'instructions test',
        medication: 'medication notice',
        problems: 'problems test',
        weight: 20.0,
      );
      expect(result, equals(Right(true)));
    });

    test('delete checkup record', () async {
      when(_mockRemoteDataSource.deleteCheckup(checkupID: kCheckupID))
          .thenAnswer((_) async => true);
      final result = await _repository.deleteCheckup(checkupID: kCheckupID);
      expect(result, equals(Right(true)));
    });

    test('retrieve checkup record', () async {
      when(_mockRemoteDataSource.retrieveCheckup(checkupID: kCheckupID))
          .thenAnswer((_) async => _tCheckupModel);
      final result = await _repository.retrieveCheckup(checkupID: kCheckupID);
      expect(result, equals(Right(_tCheckup)));
    });
  });

  group('device online and doctor hospital records use cases tests:', () {
    final _tDoctorHospitalModel = DoctorHospitalModel(
      doctorID: kDoctorID,
      hospitalID: kHospitalID,
      consultationDaysHours: "M10-12/M14-16",
      contactNo: '123456789',
      roomNo: '123',
    );
    final DoctorHospital _tDoctorHospital = _tDoctorHospitalModel;

    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('add new doctor hospital record', () async {
      when(_mockRemoteDataSource.addDoctorHospitalRecord(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      )).thenAnswer((_) async => true);
      final result = await _repository.addDoctorHospitalRecord(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      );
      expect(result, equals(Right(true)));
    });

    test('edit doctor hospital record', () async {
      when(_mockRemoteDataSource.editDoctorHospitalRecord(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      )).thenAnswer((_) async => true);
      final result = await _repository.editDoctorHospitalRecord(
        doctorID: kDoctorID,
        hospitalID: kHospitalID,
        consultationDaysHours: "M10-12/M14-16",
        contactNo: '123456789',
        roomNo: '123',
      );
      expect(result, equals(Right(true)));
    });

    test('delete doctor hospital record', () async {
      when(_mockRemoteDataSource.deleteDoctorHospitalRecord(
              doctorID: kDoctorID))
          .thenAnswer((_) async => true);
      final result =
          await _repository.deleteDoctorHospitalRecord(doctorID: kDoctorID);
      expect(result, equals(Right(true)));
    });

    test('retrieve doctor hospital record', () async {
      when(_mockRemoteDataSource.retrieveDoctorHospitalRecord(
              doctorID: kDoctorID))
          .thenAnswer((_) async => _tDoctorHospitalModel);
      final result =
          await _repository.retrieveDoctorHospitalRecord(doctorID: kDoctorID);
      expect(result, equals(Right(_tDoctorHospital)));
    });
  });

  group('device online and doctor records use cases tests:', () {
    final _tDoctorModel = DoctorModel(
      doctorID: kDoctorID,
      firstName: 'Doctor',
      lastName: 'Who',
      middleInitial: 'X',
      practice: 'Pediatrician',
    );
    final Doctor _tDoctor = _tDoctorModel;

    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('add new doctor record', () async {
      when(_mockRemoteDataSource.addDoctorRecord(
        doctorID: kDoctorID,
        firstName: 'Doctor',
        lastName: 'Who',
        middleInitial: 'X',
        practice: 'Pediatrician',
      )).thenAnswer((_) async => true);
      final result = await _repository.addDoctorRecord(
        doctorID: kDoctorID,
        firstName: 'Doctor',
        lastName: 'Who',
        middleInitial: 'X',
        practice: 'Pediatrician',
      );
      expect(result, equals(Right(true)));
    });

    test('edit doctor record', () async {
      when(_mockRemoteDataSource.editDoctorRecord(
        doctorID: kDoctorID,
        firstName: 'Doctor',
        lastName: 'Who',
        middleInitial: 'X',
        practice: 'Pediatrician',
      )).thenAnswer((_) async => true);
      final result = await _repository.editDoctorRecord(
        doctorID: kDoctorID,
        firstName: 'Doctor',
        lastName: 'Who',
        middleInitial: 'X',
        practice: 'Pediatrician',
      );
      expect(result, equals(Right(true)));
    });

    test('delete doctor record', () async {
      when(_mockRemoteDataSource.deleteDoctorRecord(doctorID: kDoctorID))
          .thenAnswer((_) async => true);
      final result = await _repository.deleteDoctorRecord(doctorID: kDoctorID);
      expect(result, equals(Right(true)));
    });

    test('retrieve doctor record', () async {
      when(_mockRemoteDataSource.retrieveDoctorRecord(doctorID: kDoctorID))
          .thenAnswer((_) async => _tDoctorModel);
      final result =
          await _repository.retrieveDoctorRecord(doctorID: kDoctorID);
      expect(result, equals(Right(_tDoctor)));
    });
  });

  group('device online and hospital records use cases tests:', () {
    final _tHospitalModel = HospitalModel(
      contactNo: '1234567',
      hospitalID: kHospitalID,
      location: 'test location',
      name: 'Test Hospital',
    );
    final Hospital _tHospital = _tHospitalModel;

    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('add new hospital record', () async {
      when(_mockRemoteDataSource.addHospitalRecord(
        contactNo: '1234567',
        hospitalID: kHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      )).thenAnswer((_) async => true);
      final result = await _repository.addHospitalRecord(
        contactNo: '1234567',
        hospitalID: kHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      );
      expect(result, equals(Right(true)));
    });

    test('edit hospital record', () async {
      when(_mockRemoteDataSource.editHospitalRecord(
        contactNo: '1234567',
        hospitalID: kHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      )).thenAnswer((_) async => true);
      final result = await _repository.editHospitalRecord(
        contactNo: '1234567',
        hospitalID: kHospitalID,
        location: 'test location',
        name: 'Test Hospital',
      );
      expect(result, equals(Right(true)));
    });

    test('delete hospital record', () async {
      when(_mockRemoteDataSource.deleteHospitalRecord(hospitalID: kHospitalID))
          .thenAnswer((_) async => true);
      final result =
          await _repository.deleteHospitalRecord(hospitalID: kHospitalID);
      expect(result, equals(Right(true)));
    });

    test('retrieve hospital record', () async {
      when(_mockRemoteDataSource.retrieveHospitalRecord(
              hospitalID: kHospitalID))
          .thenAnswer((_) async => _tHospitalModel);
      final result =
          await _repository.retrieveHospitalRecord(hospitalID: kHospitalID);
      expect(result, equals(Right(_tHospital)));
    });
  });

  group('device online and infant records use cases tests:', () {
    final _tInfantModel = InfantModel(
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
      hospitalID: kInfantID,
    );
    final Infant _tInfant = _tInfantModel;

    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('add new infant record', () async {
      when(_mockRemoteDataSource.addInfantRecord(
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
        hospitalID: kInfantID,
      )).thenAnswer((_) async => true);
      final result = await _repository.addInfantRecord(
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
        hospitalID: kInfantID,
      );
      expect(result, equals(Right(true)));
    });

    test('edit infant record', () async {
      when(_mockRemoteDataSource.editInfantRecord(
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
        hospitalID: kInfantID,
      )).thenAnswer((_) async => true);
      final result = await _repository.editInfantRecord(
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
        hospitalID: kInfantID,
      );
      expect(result, equals(Right(true)));
    });

    test('delete infant record', () async {
      when(_mockRemoteDataSource.deleteInfantRecord(infantID: kInfantID))
          .thenAnswer((_) async => true);
      final result = await _repository.deleteInfantRecord(infantID: kInfantID);
      expect(result, equals(Right(true)));
    });

    test('retrieve infant record', () async {
      when(_mockRemoteDataSource.retrieveInfantRecord(infantID: kInfantID))
          .thenAnswer((_) async => _tInfantModel);
      final result =
          await _repository.retrieveInfantRecord(infantID: kInfantID);
      expect(result, equals(Right(_tInfant)));
    });
  });

  group('device online and parent records use cases tests:', () {
    final _tParentModel = ParentModel(
      parentID: kParentID,
      birthDate: DateTime.parse("1983-10-29 20:18:04.000Z"),
      firstName: 'Mommy',
      gender: 'F',
      lastName: 'Parent',
      middleInitial: 'P',
    );
    final Parent _tParent = _tParentModel;

    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('add new parent record', () async {
      when(_mockRemoteDataSource.addParentRecord(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: kParentID,
      )).thenAnswer((_) async => true);
      final result = await _repository.addParentRecord(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: kParentID,
      );
      expect(result, equals(Right(true)));
    });

    test('edit parent record', () async {
      when(_mockRemoteDataSource.editParentRecord(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: kParentID,
      )).thenAnswer((_) async => true);
      final result = await _repository.editParentRecord(
        birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
        firstName: 'Mommy',
        gender: 'F',
        lastName: 'Parent',
        middleInitial: 'P',
        parentID: kParentID,
      );
      expect(result, equals(Right(true)));
    });

    test('delete parent record', () async {
      when(_mockRemoteDataSource.deleteParentRecord(parentID: kParentID))
          .thenAnswer((_) async => true);
      final result = await _repository.deleteParentRecord(parentID: kParentID);
      expect(result, equals(Right(true)));
    });

    test('retrieve parent record', () async {
      when(_mockRemoteDataSource.retrieveParentRecord(parentID: kParentID))
          .thenAnswer((_) async => _tParentModel);
      final result =
          await _repository.retrieveParentRecord(parentID: kParentID);
      expect(result, equals(Right(_tParent)));
    });
  });
}
