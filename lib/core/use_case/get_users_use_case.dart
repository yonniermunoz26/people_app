part of "use_case.dart";

class GetUsersUseCase {
  final IRandomUserRepository repository;

  GetUsersUseCase(this.repository);

  Future<Result<List<Person>, BackendError>> call({
    int results = 10,
  }) =>
      repository.getUsers(
        results: results,
      );
}
