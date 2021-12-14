abstract class Credentials {
  String get login;
  String get password;
  Credentials();

  @override
  String toString() {
    return 'Credentials{login=$login, password=$password}';
  }
}
