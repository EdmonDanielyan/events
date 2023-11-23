import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class StaffMovementsRequestDependency {
  Future<Response<MovementsSuccess>> call();
}
