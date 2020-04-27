import 'package:bibaw_app/core/usecases/use_case.dart';
import 'package:bibaw_app/features/app/domain/repositories/bibaw_repository.dart';
import 'package:bibaw_app/features/app/domain/usecases/add_infant_record.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBibawRepository extends Mock implements BibawRepository {}

void main() {
  AddInfantRecord usecase;
  MockBibawRepository mockBibawRepository;

  setUp(() {
    mockBibawRepository = MockBibawRepository();
    usecase = AddInfantRecord(repository: mockBibawRepository);
  });

  test('should add new infant record to repository', () async {
    when(mockBibawRepository.addInfantRecord())
        .thenAnswer((_) async => Right(true));
    final result = await usecase(NoParams());
    expect(result, Right(true));
    verify(mockBibawRepository.addInfantRecord());
    verifyNoMoreInteractions(mockBibawRepository);
  });
}
