import 'package:main_api_client/model/birthdays_success.dart';
import 'package:dio/dio.dart';

abstract class BirthdaysRequestDependency {
  Future<Response<BirthdaysSuccess>> makeRequest();
}
