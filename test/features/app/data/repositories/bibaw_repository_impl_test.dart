import 'package:bibaw_app/core/error/exceptions.dart';
import 'package:bibaw_app/core/error/failures.dart';
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
      networkInfo: _mockNetworkInfo,
    );
  });

  void runAppointmentUseCasesTests(Function body) {
    group('appointments records -->', () {
      body();
    });
  }

  void runCheckupUseCasesTests(Function body) {
    group('checkups -->', () {
      body();
    });
  }

  void runDoctorHospitalsUseCasesTests(Function body) {
    group('doctor hospitals -->', () {
      body();
    });
  }

  void runDoctorRecordsUseCasesTests(Function body) {
    group('doctor hospital -->', () {
      body();
    });
  }

  void runHospitalRecordsUseCasesTests(Function body) {
    group('hospital records -->', () {
      body();
    });
  }

  void runInfantRecordsUseCasesTests(Function body) {
    group('infant records -->', () {
      body();
    });
  }

  void runParentRecordsUseCasesTests(Function body) {
    group('parent records -->', () {
      body();
    });
  }

  void runConnectionTests(Function body) {
    group('connection tests -->', () {
      body();
    });
  }

  void runDatabaseTests(Function body) {
    group('database tests -->', () {
      body();
    });
  }

  group('device offline tests -->', () {
    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
    runDatabaseTests(() {
      group('database connectivity -->', () {
        test('should return database failure when database access fails',
            () async {
          when(_mockLocalDataSource.retrieveAppointment(
                  appointmentID: kAppointmentID))
              .thenThrow(DatabaseException());
          final _result = await _repository.retrieveAppointment(
              appointmentID: kAppointmentID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(_mockLocalDataSource.retrieveAppointment(
              appointmentID: kAppointmentID));
          expect(_result, equals(Left(DatabaseFailure())));
        });
      });
    });
    runAppointmentUseCasesTests(() {
      group('use cases -->', () {
        final _tAppointmentModel = AppointmentModel(
          appointmentID: kAppointmentID,
          date: DateTime.parse("2020-12-05 20:18:04.000Z"),
          description: "test description",
          doctorID: kDoctorID,
          hospitalID: kHospitalID,
          infantID: kInfantID,
        );
        final Appointment _tAppointment = _tAppointmentModel;

        test('should add new appointment record', () async {
          when(
            _mockLocalDataSource.addAppointment(
              appointmentID: kAppointmentID,
              date: DateTime.parse("2020-12-05 20:18:04.000Z"),
              description: "test description",
              doctorID: kDoctorID,
              hospitalID: kHospitalID,
              infantID: kInfantID,
            ),
          ).thenAnswer((_) async => true);
          final result = await _repository.addAppointment(
            appointmentID: kAppointmentID,
            date: DateTime.parse("2020-12-05 20:18:04.000Z"),
            description: "test description",
            doctorID: kDoctorID,
            hospitalID: kHospitalID,
            infantID: kInfantID,
          );
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.addAppointment(
              appointmentID: kAppointmentID,
              date: DateTime.parse("2020-12-05 20:18:04.000Z"),
              description: "test description",
              doctorID: kDoctorID,
              hospitalID: kHospitalID,
              infantID: kInfantID,
            ),
          );
          expect(result, equals(Right(true)));
        });
        test('should edit appointment record', () async {
          when(_mockLocalDataSource.editAppointment(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.editAppointment(
              appointmentID: kAppointmentID,
              date: DateTime.parse("2020-12-05 20:18:04.000Z"),
              description: "test description",
              doctorID: kDoctorID,
              hospitalID: kHospitalID,
              infantID: kInfantID,
            ),
          );
          expect(result, equals(Right(true)));
        });
        test('should delete appointment record', () async {
          when(
            _mockLocalDataSource.deleteAppointment(
                appointmentID: kAppointmentID),
          ).thenAnswer((_) async => true);
          final result = await _repository.deleteAppointment(
              appointmentID: kAppointmentID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.deleteAppointment(
                appointmentID: kAppointmentID),
          );
          expect(result, equals(Right(true)));
        });
        test('should retrieve appointment record', () async {
          when(
            _mockLocalDataSource.retrieveAppointment(
                appointmentID: kAppointmentID),
          ).thenAnswer((_) async => _tAppointmentModel);
          final result = await _repository.retrieveAppointment(
              appointmentID: kAppointmentID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.retrieveAppointment(
                appointmentID: kAppointmentID),
          );
          expect(result, equals(Right(_tAppointment)));
        });
      });
    });
    runCheckupUseCasesTests(() {
      group('use case -->', () {
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
        test('should add new checkup record', () async {
          when(_mockLocalDataSource.addCheckup(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.addCheckup(
              checkupID: kCheckupID,
              circumferenceHead: 33.1,
              date: DateTime.parse("2020-12-05 20:18:04.000Z"),
              height: 70.0,
              instructions: 'instructions test',
              medication: 'medication notice',
              problems: 'problems test',
              weight: 20.0,
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should edit checkup record', () async {
          when(_mockLocalDataSource.editCheckup(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.editCheckup(
              checkupID: kCheckupID,
              circumferenceHead: 33.1,
              date: DateTime.parse("2020-12-05 20:18:04.000Z"),
              height: 70.0,
              instructions: 'instructions test',
              medication: 'medication notice',
              problems: 'problems test',
              weight: 20.0,
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should delete checkup record', () async {
          when(_mockLocalDataSource.deleteCheckup(checkupID: kCheckupID))
              .thenAnswer((_) async => true);
          final result = await _repository.deleteCheckup(checkupID: kCheckupID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.deleteCheckup(checkupID: kCheckupID),
          );
          expect(result, equals(Right(true)));
        });

        test('should retrieve checkup record', () async {
          when(_mockLocalDataSource.retrieveCheckup(checkupID: kCheckupID))
              .thenAnswer((_) async => _tCheckupModel);
          final result =
              await _repository.retrieveCheckup(checkupID: kCheckupID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.retrieveCheckup(checkupID: kCheckupID),
          );
          expect(result, equals(Right(_tCheckup)));
        });
      });
    });
    runDoctorHospitalsUseCasesTests(() {
      group('use case -->', () {
        final _tDoctorHospitalModel = DoctorHospitalModel(
          doctorID: kDoctorID,
          hospitalID: kHospitalID,
          consultationDaysHours: "M10-12/M14-16",
          contactNo: '123456789',
          roomNo: '123',
        );
        final DoctorHospital _tDoctorHospital = _tDoctorHospitalModel;

        test('should add new doctor hospital record', () async {
          when(_mockLocalDataSource.addDoctorHospitalRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.addDoctorHospitalRecord(
              doctorID: kDoctorID,
              hospitalID: kHospitalID,
              consultationDaysHours: "M10-12/M14-16",
              contactNo: '123456789',
              roomNo: '123',
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should edit doctor hospital record', () async {
          when(_mockLocalDataSource.editDoctorHospitalRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.editDoctorHospitalRecord(
              doctorID: kDoctorID,
              hospitalID: kHospitalID,
              consultationDaysHours: "M10-12/M14-16",
              contactNo: '123456789',
              roomNo: '123',
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should delete doctor hospital record', () async {
          when(_mockLocalDataSource.deleteDoctorHospitalRecord(
                  doctorID: kDoctorID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteDoctorHospitalRecord(doctorID: kDoctorID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.deleteDoctorHospitalRecord(
                doctorID: kDoctorID),
          );
          expect(result, equals(Right(true)));
        });

        test('should retrieve doctor hospital record', () async {
          when(_mockLocalDataSource.retrieveDoctorHospitalRecord(
                  doctorID: kDoctorID))
              .thenAnswer((_) async => _tDoctorHospitalModel);
          final result = await _repository.retrieveDoctorHospitalRecord(
              doctorID: kDoctorID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.retrieveDoctorHospitalRecord(
                doctorID: kDoctorID),
          );
          expect(result, equals(Right(_tDoctorHospital)));
        });
      });
    });
    runDoctorRecordsUseCasesTests(() {
      group('use case -->', () {
        final _tDoctorModel = DoctorModel(
          doctorID: kDoctorID,
          firstName: 'Doctor',
          lastName: 'Who',
          middleInitial: 'X',
          practice: 'Pediatrician',
        );
        final Doctor _tDoctor = _tDoctorModel;

        test('should add new doctor record', () async {
          when(_mockLocalDataSource.addDoctorRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.addDoctorRecord(
              doctorID: kDoctorID,
              firstName: 'Doctor',
              lastName: 'Who',
              middleInitial: 'X',
              practice: 'Pediatrician',
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should edit doctor record', () async {
          when(_mockLocalDataSource.editDoctorRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.editDoctorRecord(
              doctorID: kDoctorID,
              firstName: 'Doctor',
              lastName: 'Who',
              middleInitial: 'X',
              practice: 'Pediatrician',
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should delete doctor record', () async {
          when(_mockLocalDataSource.deleteDoctorRecord(doctorID: kDoctorID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteDoctorRecord(doctorID: kDoctorID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.deleteDoctorRecord(doctorID: kDoctorID),
          );
          expect(result, equals(Right(true)));
        });

        test('should retrieve doctor record', () async {
          when(_mockLocalDataSource.retrieveDoctorRecord(doctorID: kDoctorID))
              .thenAnswer((_) async => _tDoctorModel);
          final result =
              await _repository.retrieveDoctorRecord(doctorID: kDoctorID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.retrieveDoctorRecord(doctorID: kDoctorID),
          );
          expect(result, equals(Right(_tDoctor)));
        });
      });
    });
    runHospitalRecordsUseCasesTests(() {
      group('use case -->', () {
        final _tHospitalModel = HospitalModel(
          contactNo: '1234567',
          hospitalID: kHospitalID,
          location: 'test location',
          name: 'Test Hospital',
        );
        final Hospital _tHospital = _tHospitalModel;

        test('should add new hospital record', () async {
          when(_mockLocalDataSource.addHospitalRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.addHospitalRecord(
              contactNo: '1234567',
              hospitalID: kHospitalID,
              location: 'test location',
              name: 'Test Hospital',
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should edit hospital record', () async {
          when(_mockLocalDataSource.editHospitalRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.editHospitalRecord(
              contactNo: '1234567',
              hospitalID: kHospitalID,
              location: 'test location',
              name: 'Test Hospital',
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should delete hospital record', () async {
          when(_mockLocalDataSource.deleteHospitalRecord(
                  hospitalID: kHospitalID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteHospitalRecord(hospitalID: kHospitalID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.deleteHospitalRecord(hospitalID: kHospitalID),
          );
          expect(result, equals(Right(true)));
        });

        test('should retrieve hospital record', () async {
          when(_mockLocalDataSource.retrieveHospitalRecord(
                  hospitalID: kHospitalID))
              .thenAnswer((_) async => _tHospitalModel);
          final result =
              await _repository.retrieveHospitalRecord(hospitalID: kHospitalID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.retrieveHospitalRecord(
                hospitalID: kHospitalID),
          );
          expect(result, equals(Right(_tHospital)));
        });
      });
    });
    runInfantRecordsUseCasesTests(() {
      group('use case -->', () {
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

        test('should add new infant record', () async {
          when(_mockLocalDataSource.addInfantRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.addInfantRecord(
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
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should edit infant record', () async {
          when(_mockLocalDataSource.editInfantRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.editInfantRecord(
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
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should delete infant record', () async {
          when(_mockLocalDataSource.deleteInfantRecord(infantID: kInfantID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteInfantRecord(infantID: kInfantID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.deleteInfantRecord(infantID: kInfantID),
          );
          expect(result, equals(Right(true)));
        });
        test('should retrieve infant record', () async {
          when(_mockLocalDataSource.retrieveInfantRecord(infantID: kInfantID))
              .thenAnswer((_) async => _tInfantModel);
          final result =
              await _repository.retrieveInfantRecord(infantID: kInfantID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.retrieveInfantRecord(infantID: kInfantID),
          );
          expect(result, equals(Right(_tInfant)));
        });
      });
    });
    runParentRecordsUseCasesTests(() {
      group('use case -->', () {
        final _tParentModel = ParentModel(
          parentID: kParentID,
          birthDate: DateTime.parse("1983-10-29 20:18:04.000Z"),
          firstName: 'Mommy',
          gender: 'F',
          lastName: 'Parent',
          middleInitial: 'P',
        );
        final Parent _tParent = _tParentModel;

        test('should add new parent record', () async {
          when(_mockLocalDataSource.addParentRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.addParentRecord(
              birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
              firstName: 'Mommy',
              gender: 'F',
              lastName: 'Parent',
              middleInitial: 'P',
              parentID: kParentID,
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should edit parent record', () async {
          when(_mockLocalDataSource.editParentRecord(
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
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.editParentRecord(
              birthDate: DateTime.parse("1983-10-29 20:18:04Z"),
              firstName: 'Mommy',
              gender: 'F',
              lastName: 'Parent',
              middleInitial: 'P',
              parentID: kParentID,
            ),
          );
          expect(result, equals(Right(true)));
        });

        test('should delete parent record', () async {
          when(_mockLocalDataSource.deleteParentRecord(parentID: kParentID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteParentRecord(parentID: kParentID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.deleteParentRecord(parentID: kParentID),
          );
          expect(result, equals(Right(true)));
        });

        test('should retrieve parent record', () async {
          when(_mockLocalDataSource.retrieveParentRecord(parentID: kParentID))
              .thenAnswer((_) async => _tParentModel);
          final result =
              await _repository.retrieveParentRecord(parentID: kParentID);
          verifyZeroInteractions(_mockRemoteDataSource);
          verify(
            _mockLocalDataSource.retrieveParentRecord(parentID: kParentID),
          );
          expect(result, equals(Right(_tParent)));
        });
      });
    });
  });

  group('device online tests -->', () {
    setUp(() {
      when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    runConnectionTests(() {
      group('server connectivity -->', () {
        test('should check if device is online', () async {
          when(_mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          _repository.retrieveAppointment(appointmentID: kAppointmentID);
          verify(_mockNetworkInfo.isConnected);
        });
        test('should return server failure when server is unreachable',
            () async {
          when(_mockRemoteDataSource.retrieveAppointment(
                  appointmentID: kAppointmentID))
              .thenThrow(ServerException());
          final _result = await _repository.retrieveAppointment(
              appointmentID: kAppointmentID);
          print(_result);
          verify(_mockRemoteDataSource.retrieveAppointment(
              appointmentID: kAppointmentID));
          verifyZeroInteractions(_mockLocalDataSource);
          expect(_result, equals(Left(ServerFailure())));
        });
      });
    });
    runAppointmentUseCasesTests(() {
      group('use cases -->', () {
        final _tAppointmentModel = AppointmentModel(
          appointmentID: kAppointmentID,
          date: DateTime.parse("2020-12-05 20:18:04.000Z"),
          description: "test description",
          doctorID: kDoctorID,
          hospitalID: kHospitalID,
          infantID: kInfantID,
        );
        final Appointment _tAppointment = _tAppointmentModel;

        test('should add new appointment record', () async {
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

        test('should edit appointment record', () async {
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

        test('should delete appointment record', () async {
          when(_mockRemoteDataSource.deleteAppointment(
                  appointmentID: kAppointmentID))
              .thenAnswer((_) async => true);
          final result = await _repository.deleteAppointment(
              appointmentID: kAppointmentID);
          expect(result, equals(Right(true)));
        });

        test('should retrieve appointment record', () async {
          when(_mockRemoteDataSource.retrieveAppointment(
                  appointmentID: kAppointmentID))
              .thenAnswer((_) async => _tAppointmentModel);
          final result = await _repository.retrieveAppointment(
              appointmentID: kAppointmentID);
          expect(result, equals(Right(_tAppointment)));
        });
      });
    });
    runCheckupUseCasesTests(() {
      group('use cases -->', () {
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

        test('should add new checkup record', () async {
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

        test('should edit checkup record', () async {
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

        test('should delete checkup record', () async {
          when(_mockRemoteDataSource.deleteCheckup(checkupID: kCheckupID))
              .thenAnswer((_) async => true);
          final result = await _repository.deleteCheckup(checkupID: kCheckupID);
          expect(result, equals(Right(true)));
        });

        test('should retrieve checkup record', () async {
          when(_mockRemoteDataSource.retrieveCheckup(checkupID: kCheckupID))
              .thenAnswer((_) async => _tCheckupModel);
          final result =
              await _repository.retrieveCheckup(checkupID: kCheckupID);
          expect(result, equals(Right(_tCheckup)));
        });
      });
    });
    runDoctorHospitalsUseCasesTests(() {
      group('use cases -->', () {
        final _tDoctorHospitalModel = DoctorHospitalModel(
          doctorID: kDoctorID,
          hospitalID: kHospitalID,
          consultationDaysHours: "M10-12/M14-16",
          contactNo: '123456789',
          roomNo: '123',
        );
        final DoctorHospital _tDoctorHospital = _tDoctorHospitalModel;

        test('should add new doctor hospital record', () async {
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

        test('should edit doctor hospital record', () async {
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

        test('should delete doctor hospital record', () async {
          when(_mockRemoteDataSource.deleteDoctorHospitalRecord(
                  doctorID: kDoctorID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteDoctorHospitalRecord(doctorID: kDoctorID);
          expect(result, equals(Right(true)));
        });

        test('should retrieve doctor hospital record', () async {
          when(_mockRemoteDataSource.retrieveDoctorHospitalRecord(
                  doctorID: kDoctorID))
              .thenAnswer((_) async => _tDoctorHospitalModel);
          final result = await _repository.retrieveDoctorHospitalRecord(
              doctorID: kDoctorID);
          expect(result, equals(Right(_tDoctorHospital)));
        });
      });
    });
    runDoctorRecordsUseCasesTests(() {
      group('use cases -->', () {
        final _tDoctorModel = DoctorModel(
          doctorID: kDoctorID,
          firstName: 'Doctor',
          lastName: 'Who',
          middleInitial: 'X',
          practice: 'Pediatrician',
        );
        final Doctor _tDoctor = _tDoctorModel;

        test('should add new doctor record', () async {
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

        test('should edit doctor record', () async {
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

        test('should delete doctor record', () async {
          when(_mockRemoteDataSource.deleteDoctorRecord(doctorID: kDoctorID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteDoctorRecord(doctorID: kDoctorID);
          expect(result, equals(Right(true)));
        });

        test('should retrieve doctor record', () async {
          when(_mockRemoteDataSource.retrieveDoctorRecord(doctorID: kDoctorID))
              .thenAnswer((_) async => _tDoctorModel);
          final result =
              await _repository.retrieveDoctorRecord(doctorID: kDoctorID);
          expect(result, equals(Right(_tDoctor)));
        });
      });
    });
    runHospitalRecordsUseCasesTests(() {
      group('use cases -->', () {
        final _tHospitalModel = HospitalModel(
          contactNo: '1234567',
          hospitalID: kHospitalID,
          location: 'test location',
          name: 'Test Hospital',
        );
        final Hospital _tHospital = _tHospitalModel;

        test('should add new hospital record', () async {
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

        test('should edit hospital record', () async {
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

        test('should delete hospital record', () async {
          when(_mockRemoteDataSource.deleteHospitalRecord(
                  hospitalID: kHospitalID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteHospitalRecord(hospitalID: kHospitalID);
          expect(result, equals(Right(true)));
        });

        test('should retrieve hospital record', () async {
          when(_mockRemoteDataSource.retrieveHospitalRecord(
                  hospitalID: kHospitalID))
              .thenAnswer((_) async => _tHospitalModel);
          final result =
              await _repository.retrieveHospitalRecord(hospitalID: kHospitalID);
          expect(result, equals(Right(_tHospital)));
        });
      });
    });
    runInfantRecordsUseCasesTests(() {
      group('use cases -->', () {
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

        test('should add new infant record', () async {
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

        test('should edit infant record', () async {
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

        test('should delete infant record', () async {
          when(_mockRemoteDataSource.deleteInfantRecord(infantID: kInfantID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteInfantRecord(infantID: kInfantID);
          expect(result, equals(Right(true)));
        });

        test('should retrieve infant record', () async {
          when(_mockRemoteDataSource.retrieveInfantRecord(infantID: kInfantID))
              .thenAnswer((_) async => _tInfantModel);
          final result =
              await _repository.retrieveInfantRecord(infantID: kInfantID);
          expect(result, equals(Right(_tInfant)));
        });
      });
    });
    runParentRecordsUseCasesTests(() {
      group('use cases -->', () {
        final _tParentModel = ParentModel(
          parentID: kParentID,
          birthDate: DateTime.parse("1983-10-29 20:18:04.000Z"),
          firstName: 'Mommy',
          gender: 'F',
          lastName: 'Parent',
          middleInitial: 'P',
        );
        final Parent _tParent = _tParentModel;
        test('should add new parent record', () async {
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

        test('should edit parent record', () async {
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

        test('should delete parent record', () async {
          when(_mockRemoteDataSource.deleteParentRecord(parentID: kParentID))
              .thenAnswer((_) async => true);
          final result =
              await _repository.deleteParentRecord(parentID: kParentID);
          expect(result, equals(Right(true)));
        });

        test('should retrieve parent record', () async {
          when(_mockRemoteDataSource.retrieveParentRecord(parentID: kParentID))
              .thenAnswer((_) async => _tParentModel);
          final result =
              await _repository.retrieveParentRecord(parentID: kParentID);
          expect(result, equals(Right(_tParent)));
        });
      });
    });
  });
}
