import 'package:bibaw_app/features/app/domain/entities/infant.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/retrieve_infant_record.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  RetrieveInfantRecord usecase;
  MockBibawRepository mockBibawRepository;

  final tInfantID = kInfantID;
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

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecase = RetrieveInfantRecord(repository: mockBibawRepository);
  });

  test('should retrieve infant record from repository', () async {
    when(mockBibawRepository.retrieveInfantRecord(infantID: tInfantID))
        .thenAnswer((_) async => Right(tInfant));
    final result = await usecase(Params(infantID: tInfantID));
    expect(result, Right(tInfant));
    verify(mockBibawRepository.retrieveInfantRecord(infantID: tInfantID));
    verifyNoMoreInteractions(mockBibawRepository);
  });
}
