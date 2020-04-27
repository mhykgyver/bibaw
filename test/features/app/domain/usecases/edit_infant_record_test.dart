import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/edit_infant_record.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  EditInfantRecord usecase;
  MockBibawRepository mockBibawRepository;

  final tInfantID = kInfantID;

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecase = EditInfantRecord(repository: mockBibawRepository);
  });

  test('should edit existing infant record in repository', () async {
    when(mockBibawRepository.editInfantRecord(infantID: tInfantID))
        .thenAnswer((_) async => Right(true));
    final result = await usecase(Params(infantID: tInfantID));
    expect(result, Right(true));
    verify(mockBibawRepository.editInfantRecord(infantID: tInfantID));
    verifyNoMoreInteractions(mockBibawRepository);
  });
}
