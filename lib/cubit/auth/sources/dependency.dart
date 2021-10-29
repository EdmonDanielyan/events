import 'package:dio/dio.dart';
import 'package:main_api_client/model/auth_success.dart';

abstract class AuthRequestDependency {
  abstract String? login;
  abstract String? password;
  Future<Response<AuthSuccess>> call();
}
