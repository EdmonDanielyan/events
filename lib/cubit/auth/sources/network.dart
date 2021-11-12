import 'package:dio/src/response.dart';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/builder/auth_params_builder.dart';
import 'package:ink_mobile/cubit/auth/sources/dependency.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/auth_api.dart';
import 'package:main_api_client/model/auth_success.dart';

@injectable
class AuthNetworkRequest extends AuthRequestDependency {
  String? login;
  String? password;
  AuthNetworkRequest(
      {@factoryParam required this.login, @factoryParam required this.password})
      : assert(login != null && password != null);

  @override
  Future<Response<AuthSuccess>> call() async {
    AuthApi auth = sl<MainApiProvider>().getAuthApi();
    final response = await auth
        .auth(
          authParams:
              CustomAuthParamsBuilder(login: login!, password: password!)
                  .build(),
        )
        .timeout(Duration(seconds: 4));
    return response;
  }
}
