import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/converter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:main_api_client/api/auth_api.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/model/refresh_token_params.dart';

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
        (curDateTime.millisecondsSinceEpoch.toInt() / 1000).ceil()
      ;

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
    MainApiClient api = MainApiClient();
    AuthApi auth = api.getAuthApi();

    RefreshTokenParamsBuilder refreshParamsBuilder = RefreshTokenParamsBuilder();
    String? refreshToken = await Token.getRefresh();

    if (refreshToken != null) {
      refreshParamsBuilder.token = refreshToken;
      RefreshTokenParams refreshParams = refreshParamsBuilder.build();

      final _response = await auth.authRefreshPost(
          refreshTokenParams: refreshParams
      );

      final refreshDataMap = _response.data?.data.asMap;

      if (refreshDataMap != null) {
        String newRefresh = refreshDataMap['refresh_token'];
        String newJwt = refreshDataMap['token'];

        api.setOAuthToken('bearerAuth', newJwt);
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

class JwtPayload {
  int expirationTime = 0;
  int? userId;

  JwtPayload(Map<String, dynamic> payloadMap) {
    this.expirationTime = payloadMap['exp'] ?? 0;
    this.userId = payloadMap['userId'];
  }
}