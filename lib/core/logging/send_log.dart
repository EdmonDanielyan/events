import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:share_plus/share_plus.dart';

Future<void> sendErrorLog(String filePath) async {
  var _file = File(filePath);
  var fileName = filePath.split("/").last;
  var directory = _file.parent;
  // Zip a directory to out.zip using the zipDirectory convenience method
  //todo: Защитить архив паролем https://github.com/jlcool/flutter_zip_archive
  var encoder = ZipFileEncoder();
  var zipFileName = "$fileName.zip";
  var zipPath = "${directory.path}/$zipFileName";
  File zipFile = File(zipPath);
  if (zipFile.existsSync()) {
    zipFile.deleteSync();
  }
  encoder.create(zipPath);
  encoder.addFile(_file);
  encoder.close();
  if (zipFile.existsSync()) {
    await
      Share.shareFiles([zipPath], text: 'Send Application log',subject: zipFileName, mimeTypes: ['application/zip']);
  }
}