import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive_io.dart';
import 'package:share_plus/share_plus.dart';

Future<void> sendErrorLog(String fileName) async {
  var directory = await getApplicationDocumentsDirectory();
  var _file = File("${directory.path}/$fileName");
  // Zip a directory to out.zip using the zipDirectory convenience method
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