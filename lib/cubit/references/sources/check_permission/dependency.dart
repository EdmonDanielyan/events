import 'package:dio/dio.dart';
import 'package:main_api_client/model/can_inquire.dart';

abstract class CanInquireRequestDependency {
  Future<Response<CanInquire>> call();
}
