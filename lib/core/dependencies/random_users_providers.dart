import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:people_app/core/use_case/use_case.dart';

import '../data_source/ru_data_source.dart';
import '../repositories/random_user/ru_repository.dart';
import 'apis_provider.dart';

final ruDataSourceProvider = Provider<RandomUserDataSource>(
  (ref) => RandomUserDataSource(client: ref.watch(clientProvider)),
);

final ruRepositoryProvider = Provider<RandomUserRepository>(
  (ref) => RandomUserRepository(
    ref.watch(ruDataSourceProvider),
  ),
);

final getUsersUseCaseProvider = Provider<GetUsersUseCase>(
  (ref) => GetUsersUseCase(
    ref.watch(ruRepositoryProvider),
  ),
);
