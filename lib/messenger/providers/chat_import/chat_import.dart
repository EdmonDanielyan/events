import 'dart:io';
import 'dart:math';

import 'package:archive/archive_io.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import 'chat_import_model.dart';

class ChatImport {
  final ChatDatabase database;
  const ChatImport(this.database);

  Future<void> export() async {
    final model = await getModel();
    final Directory directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${JwtPayload.myId}.txt';
    final File file = File(path);
    await file.writeAsString(model.toJsonCustom());

    Directory? appDocDirectory = await getExternalStorageDirectory();

    if (appDocDirectory != null) {
      var encoder = ZipFileEncoder();
      final zipPath = appDocDirectory.path + "/" + '${JwtPayload.myId}.zip';
      encoder.create(zipPath);
      encoder.addFile(file);
      encoder.close();

      final zipFile = File(zipPath);

      final size = await getFileSize(zipFile.path, 2);

      final logger = Logger("export");
      logger.finest('''
      CHATS ${model.chats.length}
      MESSAGES ${model.messages.length}
      USERS ${model.users.length}
      PARTICIPANTS ${model.participants.length}
      CAHNNELS ${model.channels.length}
      ''');
      logger.finest(size);
    }
  }

  Future<ChatImportModel> getModel() async {
    return ChatImportModel(
      chats: await database.getAllChats(),
      messages: await database.getAllMessages(),
      channels: await database.getAllChannels(),
      participants: await database.getAllParticipants(),
      users: await database.getAllUsers(),
    );
  }

  Future<String> getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }
}
