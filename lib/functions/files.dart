import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:built_collection/built_collection.dart';


List<MultipartFile> getFilesAsMultipart(List<File> files) {
  List<MultipartFile> summary = [];

  for (File file in files) {
    summary.add(MultipartFile.fromBytes(file.readAsBytesSync(),
        filename: basename(file.path)));
  }

  return summary;
}

BuiltList<Uint8List> getFilesAsBuiltList(List<File> files) {
  List<Uint8List> summary = [];

  for (File file in files) {
    summary.add(file.readAsBytesSync());
  }

  return BuiltList.from(summary);
}

bool isStringUrl(String url) {
  return Uri.tryParse(url)?.hasAbsolutePath ?? false;
}

bool isStringHttpUrl(String url) {
  return isStringUrl(url) && (url.toLowerCase().contains("http"));
}

bool isStrPicture(String picture) {
  picture = picture.toLowerCase();
  bool hasType = picture.endsWith("jpg") ||
      picture.endsWith("png") ||
      picture.endsWith("jpeg");
  return isStringUrl(picture) && hasType;
}

bool isEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
