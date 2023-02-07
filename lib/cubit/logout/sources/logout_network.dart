// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/model/logout_params.dart';
import 'package:main_api_client/model/required_success.dart';

import 'logout_source.dart';

@injectable
class LogoutNetworkRequest extends LogoutSource {
  @override
  Future<Response<RequiredSuccess>> postLogout() async {
    final authApi = getIt<MainApiProvider>().getAuthApi();
    final paramsBuilder = LogoutParamsBuilder();
    await Token.setNewTokensIfExpired();
    paramsBuilder.token = await Token.getRefresh();
    final response = await authApi.authLogoutPost(
      logoutParams: paramsBuilder.build(),
    );
    return response;
  }
}
