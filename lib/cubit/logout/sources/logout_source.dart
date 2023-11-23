import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class LogoutSource {
  Future<Response<RequiredSuccess>> postLogout();
}
