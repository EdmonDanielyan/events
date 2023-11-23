import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class ProfileFetchRequestDependency {
  abstract int? id;
  Future<Response<GetUserSuccess>> call();
  Future<Response<GetUsersSuccess>> getUsers(List<int> ids);
}
