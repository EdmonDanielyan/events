import 'dart:convert';

class StringConverter {
  final String string;
  const StringConverter({required this.string});

  String decodeBase64() {
    String output = string.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  dynamic decodeJson() {
    return json.decode(string);
  }
}
