import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final clientProvider = Provider<Dio>(
  (ref) => Dio(),
);
