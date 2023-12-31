import 'package:dio/dio.dart';
import 'package:ink_mobile/core/handlers/auth_handler.dart';
import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:openapi/openapi.dart';

import '../setup.dart';

extension AuthSuccessExt on Response<AuthSuccess> {
  Future<bool> handleResponse() async {
    final responseData = data?.data.asMap;
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

      await getIt<AuthHandler>().authChallenge(pass: true);

      // если старое значение не удалить, новое не встанет
      // OneSignal.shared.removeExternalUserId().then((result){
      //   OneSignal.shared.setExternalUserId(responseData['user_id'].toString());
      // });
      // migration
      OneSignal.logout().then((result) {
        OneSignal.login(responseData['user_id'].toString());
      });

      return true;
    } else {
      return false;
    }
  }
}
