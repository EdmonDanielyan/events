import 'dart:io';

import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';

class UploadArchiveService {
  final File file;
  const UploadArchiveService(this.file);

  Future<void> call() async {
    await MessengerApi().client.uploadArchive(file);
  }
}
