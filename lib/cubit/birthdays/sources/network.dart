import 'package:dio/src/response.dart';
import 'package:ink_mobile/cubit/birthdays/sources/dependency.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/birthdays_success.dart';

class BirthdaysNetworkRequest extends BirthdaysRequestDependency {
  BirthdaysNetworkRequest();

  @override
  Future<Response<BirthdaysSuccess>> makeRequest() async {
    UserApi userApi = MainApiClient().getUserApi();
    return await userApi.userBirthdayGet().timeout(Duration(seconds: 4));
  }
}
