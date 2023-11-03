part of 'entities.dart';

abstract class Result<T, E> {
  Result();

  bool get isFail;

  bool get isSuccess;

  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  });
}

class Success<T, E> extends Result<T, E> {
  final T _success;

  Success(T v) : _success = v;

  @override
  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  }) =>
      success(_success);

  @override
  bool get isFail => false;

  @override
  bool get isSuccess => true;
}

/// Fail result implementation class
class Fail<T, E> extends Result<T, E> {
  final E _fail;

  Fail(E e) : _fail = e;

  @override
  R when<R>({
    required R Function(E) fail,
    required R Function(T) success,
  }) =>
      fail(_fail);

  @override
  bool get isFail => true;

  @override
  bool get isSuccess => false;
}

/// This class create the base to handle the errors.
abstract class Error {
  final String? description;
  final String? err;

  const Error({
    required this.description,
    required this.err,
  });
}

/// Error handler for the backend responde errors
class BackendError extends Error {
  final int statusCode;

  const BackendError({
    String? description,
    String? err,
    required this.statusCode,
  }) : super(description: description, err: err);

  BackendError copyWith({
    String? description,
    String? err,
    int? statusCode,
  }) {
    return BackendError(
      description: description ?? this.description,
      err: err ?? this.err,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
