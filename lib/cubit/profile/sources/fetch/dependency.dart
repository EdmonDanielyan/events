import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_user_success.dart';

abstract class ProfileFetchRequestDependency {
  abstract int? id;
  Future<Response<GetUserSuccess>> makeRequest();
}
