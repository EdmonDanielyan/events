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
    UserApi userApi = sl.get<MainApiProvider>().getUserApi();
    return await userApi.userMovementsGet().timeout(Duration(seconds: 4));
  }
}
