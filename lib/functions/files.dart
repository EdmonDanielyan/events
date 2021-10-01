import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

List<MultipartFile> getFilesAsMultipart(List<File> files) {
  List<MultipartFile> summary = [];

  for (File file in files) {
    summary.add(MultipartFile.fromBytes(file.readAsBytesSync(),
        filename: basename(file.path)));
  }

  return summary;
}
