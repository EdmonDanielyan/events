
import 'dart:math';

import 'credentials.dart';


class RandomCredentials extends Credentials {
  final List<Credentials> listOfCredentials;

  int _index = -1;

  RandomCredentials(this.listOfCredentials): super() {
     _index = Random().nextInt(listOfCredentials.length - 1);
  }

  @override
  String get login => _index > 0 ? listOfCredentials[_index].login: "";

  @override
  String get password => _index > 0 ? listOfCredentials[_index].password: "";


}