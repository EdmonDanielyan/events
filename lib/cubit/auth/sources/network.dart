import 'package:dio/src/response.dart';

import 'package:dio/dio.dart';
import 'package:ink_mobile/core/builder/auth_params_builder.dart';
import 'package:ink_mobile/cubit/auth/sources/dependency.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/auth_api.dart';
import 'package:main_api_client/model/auth_success.dart';

class AuthNetworkRequest extends AuthRequestDependency {
  String login;
  String password;
  AuthNetworkRequest({required this.login, required this.password});

  @override
  Future<Response<AuthSuccess>> makeRequest() async {
    AuthApi auth = MainApiClient().getAuthApi();
    return await auth
        .auth(
          authParams:
              CustomAuthParamsBuilder(login: login, password: password).build(),
        )
        .timeout(Duration(seconds: 4));
  }
}
