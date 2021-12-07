import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats/message_delete.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import 'channels_registry.dart';

@Named("RemoveMessage")
@Injectable(as: ChannelListener)
class MessageDeletedListener extends ChannelListener {
  final ChatFunctions chatFunctions;
  final InviteSender messageSender;

  MessageDeletedListener(
      NatsProvider natsProvider,
      ChannelsRegistry registry,
      this.chatFunctions,
      this.messageSender)
      : super(natsProvider, registry);

  Future<void> onMessage(String channel, NatsMessage message) async {
    if (!registry.isListening(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as SystemPayload;
      ChatMessageDeleteFields fields =
          ChatMessageDeleteFields.fromMap(mapPayload.fields);
      final sender = fields.user;
      final myMessages =
          MessageListView.getUserMessages(fields.messages, sender.id);
      if (myMessages.isNotEmpty && sender.id != JwtPayload.myId) {
        if (fields.edited) {
          editMessages(myMessages);
        } else {
          chatFunctions.deleteMessages(myMessages);
        }
        await UseMessageProvider.messageProvider?.chatSaver
            .saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> editMessages(List<MessageTable> messages) async {
    for (final message in messages) {
      messageProvider.chatDatabaseCubit.db
          .updateMessageById(message.id, message);
    }
  }

  Future<bool> deleteMessages(List<MessageTable> messages, BuildContext context,
      {bool makeRequest = true, bool edited = false}) async {
    bool sent = true;
    if (makeRequest) {
      final chatId = messages.last.chatId;
      final channel = natsProvider.getGroupDeleteMessageChannelById(chatId);
      sent = await messageProvider.chatSendMessage
          .sendDeleteMessage(channel, messages: messages, edited: edited);

      if (!edited) {
        if (sent) {
          messageProvider.chatFunctions.deleteMessages(messages);
        } else {
          SimpleCustomSnackbar(
            context: context,
            txt: localizationInstance.noConnectionError,
            duration: const Duration(seconds: 2),
          );
        }
      }
    } else {
      messageProvider.chatFunctions.deleteMessages(messages);
    }

    messageProvider.saveChats(newChat: null);

    return sent;
  }
}
