import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ink_mobile/core/handlers/AuthHandler.dart';
import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/cubit/auth/sources/dependency.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/model/auth_success.dart';

class AuthUser {
  final AuthRequestDependency dependency;

  AuthUser({required this.dependency});

  Future<Map?> call() async {
    Response<AuthSuccess> response = await dependency.makeRequest();
    return response.data?.data.asMap;
  }

  Future<bool> handleResponse(Map? responseData) async {
    if (responseData != null) {
      String token = responseData['token'];
      String refreshToken = responseData['refresh_token'];

      SetOauthToken(token: token).setBearer();

      await Token.setRefresh(refreshToken);
      await Token.setJwt(token);
      GetIt.I<AuthHandler>().onSuccessAuth();
      return true;
    } else {
      return false;
    }
  }
}
