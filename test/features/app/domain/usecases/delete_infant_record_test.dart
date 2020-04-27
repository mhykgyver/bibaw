import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/delete_infant_record.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/utils/constants.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  DeleteInfantRecord usecase;
  MockBibawRepository mockBibawRepository;

  final tInfantID = kInfantID;

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecase = DeleteInfantRecord(repository: mockBibawRepository);
  });

  test('should delete existing infant record in repository', () async {
    when(mockBibawRepository.deleteInfantRecord(infantID: tInfantID))
        .thenAnswer((_) async => Right(true));
    final result = await usecase(Params(infantID: tInfantID));
    expect(result, Right(true));
    verify(mockBibawRepository.deleteInfantRecord(infantID: tInfantID));
    verifyNoMoreInteractions(mockBibawRepository);
  });
}
