import 'package:bibaw_app/features/app/data/models/appointment_model.dart';
import 'package:bibaw_app/features/app/domain/entities/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockFirestore extends Mock implements Firestore {}

class MockDocument extends Mock implements DocumentSnapshot {}

void main() {
  final _tAppointmentModel = AppointmentModel(
    appointmentID: kAppointmentID,
    date: DateTime.parse("2020-12-05 20:18:04Z"),
    description: "test description",
    doctorID: kDoctorID,
    hospitalID: kHospitalID,
    infantID: kInfantID,
  );

  group('AppointmentModel tests: ', () {
    final tAppointmentID = kAppointmentID;
    final tInfantID = kInfantID;
    final tDoctorID = kDoctorID;
    final tHospitalID = kHospitalID;
    test('should be a subclass of Appointment', () async {
      expect(_tAppointmentModel, isA<Appointment>());
    });

    test('store and retrieve document from Firestore', () async {
      final instance = MockFirestoreInstance();
      await instance.collection('appointments').add({
        'appointmentID': tAppointmentID,
        'date': DateTime.parse("2020-12-05 20:18:04Z"),
        'description': "test description",
        'doctorID': tDoctorID,
        'hospitalID': tHospitalID,
        'infantID': tInfantID,
      });

      final snapshot = await instance.collection('appointments').getDocuments();
      final String expected = _tAppointmentModel.props[0];
      final String result = snapshot.documents[0].data['appointmentID'];
      expect(expected, result);
    });
  });
}
