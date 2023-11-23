import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class CanInquireRequestDependency {
  Future<Response<CanInquire>> call();
}
