import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ink_mobile/core/handlers/AuthHandler.dart';
import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/model/auth_success.dart';

extension AuthSuccessExt on Response<AuthSuccess> {
  Future<bool> handleResponse() async {
    final responseData = this.data?.data.asMap;
    if (responseData != null) {
      String token = responseData['token'];
      String refreshToken = responseData['refresh_token'];

      SetOauthToken(token: token).setBearer();

      await Token.setRefresh(refreshToken);
      await Token.setJwt(token);
      await Token.setNatsToken();
      await Token.setDeviceVirtualIdIfEmpty();
      GetIt.I<AuthHandler>().onSuccessAuth();
      return true;
    } else {
      return false;
    }
  }
}
