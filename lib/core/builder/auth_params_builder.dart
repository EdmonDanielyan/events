import 'package:main_api_client/model/auth_params.dart';

class CustomAuthParamsBuilder {
  final String login;
  final String password;
  CustomAuthParamsBuilder({required this.login, required this.password});

  AuthParams build() {
    AuthParamsBuilder authBuilder = AuthParamsBuilder();

    authBuilder.login = login;
    authBuilder.password = password;
    return authBuilder.build();
  }
}
