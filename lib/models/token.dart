// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';

import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/messenger/providers/app_token.dart';
import 'package:ink_mobile/messenger/providers/logger.dart' as customLogger;
import 'package:ink_mobile/models/converter.dart';
import 'package:ink_mobile/providers/device_info.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/auth_api.dart';
import 'package:main_api_client/model/refresh_token_params.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:uuid/uuid.dart';

import '../providers/secure_storage.dart';
import 'jwt_payload.dart';

abstract class Token {
  static Future<String> getUserId() async {
    JwtPayload? authUser = await Token.getJwtPayloadObject();
    return authUser!.userId.toString();
  }

  static Future<JwtPayload?> getJwtPayloadObject() async {
    String? jwtToken = await Token.getJwt();
    return parseJwtPayloadObject(jwtToken);
  }

  static JwtPayload? parseJwtPayloadObject(String? jwtToken) {
    if (jwtToken != null) {
      List parts = jwtToken.split('.');

      if (parts.length != 3) {
        throw Exception('invalid token');
      }

      String payload = StringConverter(string: parts[1]).decodeBase64();
      Map<String, dynamic> payloadMap =
          StringConverter(string: payload).decodeJson();

      return JwtPayload.fromJson(payloadMap);
    }

    return null;
  }

  static Future<void> deleteTokens() async {
    await getIt<SecureStorage>().deleteAll();
  }

  static Future<bool> isJwtExpired() async {
    JwtPayload? payload = await Token.getJwtPayloadObject();

    if (payload != null) {
      DateTime curDateTime = DateTime.now();

      int curDateTimestamp =
          (curDateTime.millisecondsSinceEpoch.toInt() / 1000).ceil();

      return curDateTimestamp > payload.expirationTime - 30;
    }

    return true;
  }

  static Future<bool> setNewTokensIfExpired() async {
    bool isJwtExpired = await Token.isJwtExpired();
    if (isJwtExpired) {
      await Token._setNewTokens();
    }

    return isJwtExpired;
  }

  static Future<void> _setNewTokens() async {
    try {
      AuthApi auth = getIt<MainApiProvider>().getAuthApi();

      RefreshTokenParamsBuilder refreshParamsBuilder =
          RefreshTokenParamsBuilder();
      String? refreshToken = await Token.getRefresh();

      if (refreshToken != null) {
        refreshParamsBuilder.token = refreshToken;
        RefreshTokenParams refreshParams = refreshParamsBuilder.build();

        final _response =
            await auth.authRefreshPost(refreshTokenParams: refreshParams);

        final refreshDataMap = _response.data?.data.asMap;
        if (refreshDataMap != null) {
          String newRefresh = refreshDataMap['refresh_token'];
          String newJwt = refreshDataMap['token'];

          SetOauthToken(token: newJwt).setBearer();
          await Token.setJwt(newJwt);
          await Token.setRefresh(newRefresh);

          // если старое значение не удалить, новое не встанет
          OneSignal.shared.removeExternalUserId().then((result){
            OneSignal.shared.setExternalUserId(refreshDataMap['user_id'].toString());
          });
        }
      } else {
        throw InvalidRefreshTokenException();
      }
    } catch (e) {
      customLogger.logger.e("ERROR UPDATING TOKEn $e");
    }
  }

  static Future<DateTime?> getJwtExpired() async {
    final payload = await Token.getJwtPayloadObject();

    return payload != null
        ? DateTime.fromMillisecondsSinceEpoch(payload.expirationTime,
            isUtc: true)
        : null;
  }

  static Future<String?> getJwt() async {
    return await Token._getTokenByType(TokenTypes.jwt);
  }

  static Future<String?> getRefresh() async {
    return await Token._getTokenByType(TokenTypes.refresh);
  }

  static Future<String?> getLocalDbToken() async {
    return await Token._getTokenByType(TokenTypes.localDbToken);
  }

  static Future<String?> _getTokenByType(TokenType type) async {
    return await getIt<SecureStorage>().read(type.key);
  }

  static Future<void> setJwt(String value) async {
    await Token._setTokenByType(TokenTypes.jwt, value);
    getIt<AppTokenProvider>().setToken(value);
  }

  static Future<void> setRefresh(String value) async {
    await Token._setTokenByType(TokenTypes.refresh, value);
  }

  static Future<void> _setTokenByType(TokenType type, String value) async {
    await getIt<SecureStorage>().write(key: type.key, value: value);
  }

  static Future<void> setDeviceVirtualIdIfEmpty() async {
    if (!await getIt<SecureStorage>().containsKey(DeviceTypes.virtualId.key)) {
      await getIt<SecureStorage>()
          .write(key: DeviceTypes.virtualId.key, value: Uuid().v4());
    }
  }

  static Future<String?> getDeviceVirtualId() async {
    return await DeviceInfoProvider().getDeviceId();
  }

  static Future<void> setNatsToken() async {
    JwtPayload? payload = await Token.getJwtPayloadObject();
    await getIt<SecureStorage>()
        .write(key: NatsTypes.natsToken.key, value: payload!.natsToken);
  }

  static Future<String?> getNatsToken() async {
    return await getIt<SecureStorage>().read(NatsTypes.natsToken.key);
  }

  static setLocalDbToken(String dbLocalToken) async {
    await Token._setTokenByType(TokenTypes.localDbToken, dbLocalToken);
  }
}

class TokenTypes {
  static const TokenType jwt = TokenType('token');
  static const TokenType refresh = TokenType('refreshToken');

  static TokenType localDbToken = TokenType('localDbToken');
}

class TokenType {
  final String key;

  const TokenType(String key) : key = key;
}

class DeviceTypes {
  static const TokenType virtualId = TokenType('virtualId');
}

class NatsTypes {
  static const TokenType natsToken = TokenType('natsToken');
}

class DeviceType {
  final String key;

  const DeviceType(String key) : key = key;
}

@module
abstract class TokenDataInjectorModule {
  @Named("userId")
  String get userId => GetIt.I.get<TokenDataHolder>().userId;

  @Named("messengerAuthLogin")
  String get messengerAuthLogin => GetIt.I.get<TokenDataHolder>().userId;

  @Named("messengerAuthPassword")
  String get messengerAuthPassword =>
      GetIt.I.get<TokenDataHolder>().localDatabasePassword;

  @Named("natsToken")
  String get natsToken => GetIt.I.get<TokenDataHolder>().natsToken;

  @Named("deviceVirtualId")
  String get deviceVirtualId => GetIt.I.get<TokenDataHolder>().deviceVirtualId;

  @Named("localDatabasePassword")
  String get localDatabasePassword =>
      GetIt.I.get<TokenDataHolder>().localDatabasePassword;
}

@lazySingleton
class TokenDataHolder with Loggable {
  String _userId = "";

  String _deviceVirtualId = "";

  String _natsToken = "";

  String _localDatabasePassword = "";

  String get userId => _userId;

  String get deviceVirtualId => _deviceVirtualId;

  String get natsToken => _natsToken;

  String get localDatabasePassword => _localDatabasePassword;

  Future<void> update() async {
    logger.fine("update");
    _userId = await Token.getUserId();
    _deviceVirtualId = await Token.getDeviceVirtualId() ?? "";
    _natsToken = await Token.getNatsToken() ?? "";
    _localDatabasePassword = await Token.getLocalDbToken() ?? "";
    logger.fine(() =>
        "_userId: $_userId, _deviceVirtualId: $_deviceVirtualId, _natsToken: $_natsToken, _localDatabasePassword: $_localDatabasePassword ");
  }
}
