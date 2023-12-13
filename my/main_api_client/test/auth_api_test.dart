import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    // Авторизация
    //
    //Future<AuthSuccess> auth({ AuthParams authParams }) async
    test('test auth', () async {
      // TODO
    });

    // Выход из профиля
    //
    //Future<RequiredSuccess> authLogoutPost({ LogoutParams logoutParams }) async
    test('test authLogoutPost', () async {
      // TODO
    });

    // Продление JWT токена по refresh token
    //
    //Future<AuthSuccess> authRefreshPost({ RefreshTokenParams refreshTokenParams }) async
    test('test authRefreshPost', () async {
      // TODO
    });

    // Подтверждение регистрации по коду из SMS
    //
    //Future<RegisterConfirmSuccess> authRegisterConfirmPost({ RegisterConfirmParams registerConfirmParams }) async
    test('test authRegisterConfirmPost', () async {
      // TODO
    });

    // Регистрация
    //
    //Future<RegisterSuccess> authRegisterPost({ RegisterParams registerParams }) async
    test('test authRegisterPost', () async {
      // TODO
    });

  });
}
