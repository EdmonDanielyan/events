import 'dart:convert';

abstract class Sender {
  const Sender();

  List<int> toBytes(String object) {
    return utf8.encode(object);
  }
}
