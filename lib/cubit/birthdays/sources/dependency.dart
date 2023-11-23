import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class BirthdaysRequestDependency {
  Future<Response<BirthdaysSuccess>> call();
}
