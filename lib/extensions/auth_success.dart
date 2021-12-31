// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/core/handlers/AuthHandler.dart';
import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/model/auth_success.dart';

import '../setup.dart';

extension AuthSuccessExt on Response<AuthSuccess> {
  Future<bool> handleResponse() async {
    final responseData = this.data?.data.asMap;
    if (responseData != null) {
      String token = responseData['token'];
      String refreshToken = responseData['refresh_token'];
      String dbLocalToken = responseData['dbLocalToken'];

      SetOauthToken(token: token).setBearer();

      await Token.setRefresh(refreshToken);
      await Token.setLocalDbToken(dbLocalToken);
      await Token.setJwt(token);
      await Token.setNatsToken();
      await Token.setDeviceVirtualIdIfEmpty();

      await sl<AuthHandler>().authChallenge();
      return true;
    } else {
      return false;
    }
  }
}
