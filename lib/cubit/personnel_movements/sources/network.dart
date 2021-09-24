import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/movements_success.dart';

import 'dependency.dart';

class StaffMovementsNetworkRequest extends StaffMovementsRequestDependency {
  StaffMovementsNetworkRequest();

  @override
  Future<Response<MovementsSuccess>> makeRequest() async {
    UserApi userApi = MainApiClient().getUserApi();
    return await userApi.userMovementsGet().timeout(Duration(seconds: 4));
  }
}
