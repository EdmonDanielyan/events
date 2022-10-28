// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_user_success.dart';
import 'package:main_api_client/model/get_users_success.dart';

abstract class ProfileFetchRequestDependency {
  abstract int? id;
  Future<Response<GetUserSuccess>> call();
  Future<Response<GetUsersSuccess>> getUsers(List<int> ids);
}
