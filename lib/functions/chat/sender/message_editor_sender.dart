import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/message_delete.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../chat_functions.dart';
import '../user_functions.dart';
import 'chat_saver.dart';

@injectable
class MessageEditorSender {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatFunctions chatFunctions;
  final ChatSaver chatSaver;

  MessageEditorSender(this.natsProvider, this.userFunctions, this.chatFunctions, this.chatSaver);

  Future<void> sendDeleteMessages(List<MessageTable> messages, BuildContext context,
      {bool makeRequest = true}) async {
    if (makeRequest) {
      final chatId = messages.last.chatId;
      final channel = natsProvider.getGroupDeleteMessageChannelById(chatId);
      final sent =
      await natsProvider.sendSystemMessageToChannel(
        channel,
        MessageType.RemoveMessage,
        ChatMessageDeleteFields(
          messages: messages,
          user: userFunctions.me,
        ).toMap(),
      );

      if (sent) {
        chatFunctions.deleteMessages(messages);
      } else {
        SimpleCustomSnackbar(
          context: context,
          txt: localizationInstance.noConnectionError,
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      chatFunctions.deleteMessages(messages);
    }

    chatSaver.saveChats(newChat: null);
  }
}