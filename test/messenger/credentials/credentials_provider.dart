import 'dart:io';

import 'package:yaml/yaml.dart';

import 'credentials.dart';

class CredentialsProvider {
   List<Credentials> _users = [];

   List<Credentials> get users => _users;

  void load(String path) {
     var data = loadYaml(File(path).readAsStringSync());
     _users = (data["users"] as List).map<Credentials>((user) => CredentialsImpl(user["login"], user["password"])).toList();
   }
}


class CredentialsImpl extends Credentials {
  final String  _login, _password;
  @override
  String get login => _login;
  @override
  String get password => _password;

  CredentialsImpl(this._login, this._password);
}