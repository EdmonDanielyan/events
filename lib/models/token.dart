import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/converter.dart';
import 'package:ink_mobile/providers/device_info.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/auth_api.dart';
import 'package:main_api_client/model/refresh_token_params.dart';
import 'package:uuid/uuid.dart';

abstract class Token {
  static Future<String> getUserId() async {
    JwtPayload? authUser = await Token.getJwtPayloadObject();
    return authUser!.userId.toString();
  }

  static Future<JwtPayload?> getJwtPayloadObject() async {
    String? jwtToken = await Token.getJwt();
    if (jwtToken != null) {
      List parts = jwtToken.split('.');

      if (parts.length != 3) {
        throw Exception('invalid token');
      }

      String payload = Converter.decodeBase64(parts[1]);
      Map<String, dynamic> payloadMap = Converter.decodeJson(payload);

      if (payloadMap is! Map<String, dynamic>) {
        throw Exception('invalid payload');
      }

      return new JwtPayload(payloadMap);
    }

    return null;
  }

  static Future<void> deleteTokens() async {
    await sl<SecureStorage>().deleteAll();
  }

  static Future<bool> isJwtExpired() async {
    JwtPayload? payload = await Token.getJwtPayloadObject();

    if (payload != null) {
      DateTime curDateTime = DateTime.now();

      int curDateTimestamp =
          (curDateTime.millisecondsSinceEpoch.toInt() / 1000).ceil();

      if (curDateTimestamp > payload.expirationTime - 5) {
        return true;
      }
    }

    return false;
  }

  static Future<bool> setNewTokensIfExpired() async {
    bool isJwtExpired = await Token.isJwtExpired();
    if (isJwtExpired) {
      await Token._setNewTokens();
    }

    return isJwtExpired;
  }

  static Future<void> _setNewTokens() async {
    AuthApi auth = sl<MainApiProvider>().getAuthApi();

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
      } else {
        throw UnknownErrorException();
      }
    } else {
      throw InvalidRefreshTokenException();
    }
  }

  static Future<String?> getJwt() async {
    return await Token._getTokenByType(TokenTypes.jwt);
  }

  static Future<String?> getRefresh() async {
    return await Token._getTokenByType(TokenTypes.refresh);
  }

  static Future<String?> _getTokenByType(TokenType type) async {
    return await sl<SecureStorage>().read(type.key);
  }

  static Future<void> setJwt(String value) async {
    await Token._setTokenByType(TokenTypes.jwt, value);
  }

  static Future<void> setRefresh(String value) async {
    await Token._setTokenByType(TokenTypes.refresh, value);
  }

  static Future<void> _setTokenByType(TokenType type, String value) async {
    await sl<SecureStorage>().write(key: type.key, value: value);
  }

  static Future<void> setDeviceVirtualIdIfEmpty() async {
    if (!await sl<SecureStorage>().containsKey(DeviceTypes.virtualId.key)) {
      await sl<SecureStorage>()
          .write(key: DeviceTypes.virtualId.key, value: Uuid().v4());
    }
  }

  static Future<String?> getDeviceVirtualId() async {
    return await DeviceInfoProvider().getDeviceId();
  }

  static Future<void> setNatsToken() async {
    JwtPayload? payload = await Token.getJwtPayloadObject();
    await sl<SecureStorage>()
        .write(key: NatsTypes.natsToken.key, value: payload!.natsToken);
  }

  static Future<String?> getNatsToken() async {
    return await sl<SecureStorage>().read(NatsTypes.natsToken.key);
  }
}

@lazySingleton
class SecureStorage {
  final FlutterSecureStorage _prefs = FlutterSecureStorage();
  Future<String?> read(String key) async {
    return _prefs.read(key: key);
  }

  Future<void> deleteAll() {
    return _prefs.deleteAll();
  }

  Future<void> write({required String key, required String value}) {
    return _prefs.write(key: key, value: value);
  }

  Future<bool> containsKey(String key) {
    return _prefs.containsKey(key: key);
  }
}

class TokenTypes {
  static const TokenType jwt = TokenType('token');
  static const TokenType refresh = TokenType('refreshToken');
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

class JwtPayload {
  String natsToken = '';

  int expirationTime = 0;
  int userId = 0;
  String avatar = '';
  String name = '';
  String lastName = '';
  String secondName = '';

  static late int myId;
  static late String myAvatar;
  static late String myName;

  JwtPayload(Map<String, dynamic> payloadMap) {
    this.natsToken = payloadMap['nats_token'] ?? null;
    this.expirationTime = payloadMap['exp'];
    this.userId = payloadMap['userId'];
    this.avatar = payloadMap['avatar'];
    this.name = payloadMap['name'];
    this.lastName = payloadMap['last_name'];
    this.secondName = payloadMap['second_name'];

    myId = payloadMap['userId'];
    myAvatar = payloadMap['avatar'] ?? "";
    myName = "${payloadMap['name']} ${payloadMap['last_name']}".trim();
  }
}

@module
abstract class TokenDataInjectorModule {
  @Named("userId")
  String get userId => GetIt.I.get<TokenDataHolder>().userId;

  @Named("natsToken")
  String get natsToken => GetIt.I.get<TokenDataHolder>().natsToken;

  @Named("deviceVirtualId")
  String get deviceVirtualId => GetIt.I.get<TokenDataHolder>().deviceVirtualId;
}

@lazySingleton
class TokenDataHolder with Loggable {
  late String _userId;

  late String _deviceVirtualId;

  late String _natsToken;

  String get userId => _userId;
  String get deviceVirtualId => _deviceVirtualId;
  String get natsToken => _natsToken;

  Future<void> update() async {
    logger.fine("update");
    _userId = await Token.getUserId();
    _deviceVirtualId = await Token.getDeviceVirtualId() ?? "";
    _natsToken = await Token.getNatsToken() ?? "";
    logger.fine(
        "_userId: $_userId, _deviceVirtualId: $_deviceVirtualId, _natsToken: $_natsToken ");
  }
}
