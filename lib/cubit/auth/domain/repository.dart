import 'package:ink_mobile/cubit/auth/sources/dependency.dart';
import 'package:ink_mobile/cubit/auth/sources/network.dart';

class AuthRepository {
  final String login;
  final String password;
  AuthRepository({required this.login, required this.password});

  AuthRequestDependency getDependency() {
    return AuthNetworkRequest(login: login, password: password);
  }
}
