import '../../entities/entities.dart';

abstract class IRandomUserRepository {
  Future<Result<List<Person>, BackendError>> getUsers({
    required int results,
  });
}
