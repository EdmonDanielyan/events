import 'dart:io';
import 'dart:math';

import 'package:archive/archive_io.dart';
import 'package:ink_mobile/messenger/api/services/download_archive_service.dart';
import 'package:ink_mobile/messenger/api/services/upload_archive_service.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/providers/chat_import/chat_import_storage.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import 'chat_import_model.dart';

class ChatImport {
  final ChatDatabase database;
  final ChatImportStorage storage;
  const ChatImport(this.database, this.storage);

  Future<void> import() async {
    final logger = Logger("import");
    try {
      final chats = await database.getAllChats();

      if (chats.isEmpty) {
        final body = await DownloadArchiveService()
            .call()
            .timeout(Duration(seconds: 5), onTimeout: () => null);
        if (body != null) {
          final file = await extractZipFile(body);

          if (file != null) {
            final content = await file.readAsString();

            if (content.isNotEmpty) {
              final ChatImportModel model = ChatImportModel.fromJson(content);

              logger.fine("IMPORTING FILES");

              await database.insertChats(model.chats);
              await database.insertMultipleMessages(model.messages);
              await database.insertMultipleUsers(model.users);
              await database.insertMultipleParticipants(model.participants);
              await database.insertMultipleChannels(model.channels);

              logger.fine(''' FILES IMPORTED 
                              CHATS ${model.chats.length}
                              MESSAGES ${model.messages.length}
                              USERS ${model.users.length}
                              PARTICIP ${model.participants.length}
                              CHANNELS ${model.channels.length}
              
              ''');
            }
          }
        }
      }
    } catch (e) {
      logger.warning("Error importing $e");
    }
  }

  Future<void> export() async {
    final logger = Logger("export");
    try {
      if (!await storage.isAvailable()) {
        logger.fine("EXPORT IS NOT AVAILABLE");
        return;
      }

      final model = await getModel();
      final file = await createTxt(model);
      final zipFile = await createZip(file);

      if (zipFile != null) {
        await uploadFile(zipFile, model);
        await storage.setDate();
      }
    } catch (e) {
      logger.fine("ERROR WHILE EXPORTING $e");
    }
  }

  Future<File> createTxt(ChatImportModel model) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${JwtPayload.myId}.txt';
    final File file = File(path);
    await file.writeAsString(model.toJsonCustom());

    return file;
  }

  Future<File?> createZip(File file) async {
    Directory? appDocDirectory = await getApplicationDocumentsDirectory();

    var encoder = ZipFileEncoder();
    final zipPath = appDocDirectory.path + "/" + '${JwtPayload.myId}.zip';
    encoder.create(zipPath);
    encoder.addFile(file);
    encoder.close();

    final zipFile = File(zipPath);

    return zipFile;
  }

  Future<File?> extractZipFile(List<int> data) async {
    Directory? appDocDirectory = await getApplicationDocumentsDirectory();
    final zipPath = appDocDirectory.path + "/" + 'out.zip';
    final zipFile = ZipDecoder().decodeBytes(data);
    extractArchiveToDisk(zipFile, zipPath);

    return File('$zipPath/${JwtPayload.myId}.txt');
  }

  Future<void> uploadFile(File zipFile, ChatImportModel model) async {
    final size = await getFileSize(zipFile.path, 2);

    final logger = Logger("export");
    logger.finest(''' EXPORTING DATA
      CHATS ${model.chats.length}
      MESSAGES ${model.messages.length}
      USERS ${model.users.length}
      PARTICIPANTS ${model.participants.length}
      CAHNNELS ${model.channels.length}
      ''');
    logger.finest(size);

    if (model.chats.length > 0 && model.messages.length > 0) {
      await UploadArchiveService(zipFile)
          .call()
          .timeout(Duration(seconds: 3), onTimeout: () => null);
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
