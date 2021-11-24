import 'package:dio/dio.dart';
import 'package:main_api_client/model/movements_success.dart';

abstract class StaffMovementsRequestDependency {
  Future<Response<MovementsSuccess>> call();
}
