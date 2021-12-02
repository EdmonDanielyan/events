import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/functions/chat/sender/message_sender.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats/message_delete.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

@injectable
class MessageDeletedListener {
  // final MessageProvider messageProvider;
  final NatsProvider natsProvider;
  final ChatFunctions chatFunctions;
  final ChatSaver chatSaver;
  final MessageSender messageSender;
  MessageDeletedListener(
      this.natsProvider,
      this.chatFunctions,
      this.chatSaver,
      this.messageSender);

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider!.natsListener;
  bool isListeningToChannel(String channel) =>
      natsListener.listeningToChannel(channel);

  Future<void> listenTo(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    try {
      if (!isListeningToChannel(channel)) {
        await natsProvider.subscribeToChannel(channel, onMessage,
            startSequence: startSequence);
      }
    } on SubscriptionAlreadyExistException {}
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    if (!isListeningToChannel(channel)) {
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
        chatFunctions.deleteMessages(myMessages);
        await UseMessageProvider.messageProvider?.chatSaver.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> deleteMessages(List<MessageTable> messages, BuildContext context,
      {bool makeRequest = true}) async {
    if (makeRequest) {
      final chatId = messages.last.chatId;
      final channel = natsProvider.getGroupDeleteMessageChannelById(chatId);
      final sent = await messageSender
          .sendDeleteMessage(channel, messages: messages);

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
