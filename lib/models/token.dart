import 'package:ink_mobile/core/token/set_token.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/converter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/auth_api.dart';
import 'package:main_api_client/model/refresh_token_params.dart';
import 'package:uuid/uuid.dart';

class Token {
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
    FlutterSecureStorage storage = Storage.getInstance();

    await storage.deleteAll();
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
    AuthApi auth = sl.get<MainApiProvider>().getAuthApi();

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
    FlutterSecureStorage storage = Storage.getInstance();
    return await storage.read(key: type.key);
  }

  static Future<void> setJwt(String value) async {
    await Token._setTokenByType(TokenTypes.jwt, value);
  }

  static Future<void> setRefresh(String value) async {
    await Token._setTokenByType(TokenTypes.refresh, value);
  }

  static Future<void> _setTokenByType(TokenType type, String value) async {
    FlutterSecureStorage storage = Storage.getInstance();

    await storage.write(key: type.key, value: value);
  }

  static Future<void> setDeviceVirtualIdIfEmpty() async {
    FlutterSecureStorage storage = Storage.getInstance();
    if (!await storage.containsKey(key: DeviceTypes.virtualId.key))
      await storage.write(key: DeviceTypes.virtualId.key, value: Uuid().v4());
  }

  static Future<String?> getDeviceVirtualId() async {
    FlutterSecureStorage storage = Storage.getInstance();
    return await storage.read(key: DeviceTypes.virtualId.key);
  }

  static Future<void> setNatsToken() async {
    JwtPayload? payload = await Token.getJwtPayloadObject();
    FlutterSecureStorage storage = Storage.getInstance();
    await storage.write(key: NatsTypes.natsToken.key, value: payload!.natsToken);
  }

  static Future<String?> getNatsToken() async {
    FlutterSecureStorage storage = Storage.getInstance();
    return await storage.read(key: NatsTypes.natsToken.key);
  }
}

class Storage {
  static final FlutterSecureStorage prefs = new FlutterSecureStorage();

  static FlutterSecureStorage getInstance() {
    return prefs;
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
