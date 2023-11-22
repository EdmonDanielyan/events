import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';

class SetOauthToken {
  final String token;

  SetOauthToken({required this.token});

  void setBearer() {
    getIt<MainApiProvider>().setBearerAuth("bearerAuth", token);
  }
}
