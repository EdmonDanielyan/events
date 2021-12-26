// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/movements_success.dart';

import 'dependency.dart';

@singleton
class StaffMovementsNetworkRequest extends StaffMovementsRequestDependency {
  StaffMovementsNetworkRequest();

  @override
  Future<Response<MovementsSuccess>> call() async {
    UserApi userApi = sl<MainApiProvider>().getUserApi();
    return await userApi.userMovementsGet().timeout(Duration(seconds: 4));
  }
}
