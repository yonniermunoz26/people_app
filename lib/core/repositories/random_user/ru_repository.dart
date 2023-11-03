import '../../data_source/ru_data_source.dart';
import '../../entities/entities.dart';
import 'iru_repository.dart';

class RandomUserRepository implements IRandomUserRepository {
  final RandomUserDataSource dataSource;

  RandomUserRepository(
    this.dataSource,
  );

  @override
  Future<Result<List<Person>, BackendError>> getUsers({
    required int results,
  }) async {
    final result = await dataSource.getUsers(
      results: results,
    );
    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success(
        success
            .map(
              (p) => p.toEntity(),
            )
            .toList(),
      ),
    );
  }
}
