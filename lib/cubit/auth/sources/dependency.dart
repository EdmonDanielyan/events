import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class AuthRequestDependency {
  abstract String? login;
  abstract String? password;
  Future<Response<AuthSuccess>> call();
}
