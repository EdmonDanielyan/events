// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/builder/auth_params_builder.dart';
import 'package:ink_mobile/cubit/auth/sources/dependency.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';

@injectable
class AuthNetworkRequest extends AuthRequestDependency {
  @override
  String? login;
  @override
  String? password;
  AuthNetworkRequest(
      {@factoryParam required this.login, @factoryParam required this.password})
      : assert(login != null && password != null);

  @override
  Future<Response<AuthSuccess>> call() async {
    AuthApi auth = getIt<MainApiProvider>().getAuthApi();
    final response = await auth.auth(
      authParams:
          CustomAuthParamsBuilder(login: login!, password: password!).build(),
    );
    return response;
  }
}
