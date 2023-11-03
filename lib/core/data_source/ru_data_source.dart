import 'package:dio/dio.dart';
import 'package:people_app/core/models/models.dart';

import '../entities/entities.dart' show Result, BackendError, Fail, Success;

const kRootPath = '/api';
const kHost = 'randomuser.me';

class RandomUserDataSource {
  final Dio client;

  RandomUserDataSource({
    required this.client,
  });

  Future<Result<List<PersonModel>, BackendError>> getUsers({
    required int results,
  }) async {
    try {
      const String path = '$kRootPath/';
      final uri = Uri.https(
        kHost,
        path,
        {
          "results": "$results",
        },
      );
      final result = await client.getUri(uri);
      final List res = result.data["results"];
      return Success(
        res
            .map(
              (p) => PersonModel.fromJson(p),
            )
            .toList(),
      );
    } on DioException catch (e) {
      return Fail(
        BackendError(
          description: e.message,
          err: e.error.toString(),
          statusCode: e.response?.statusCode ?? 0,
        ),
      );
    }
  }
}
