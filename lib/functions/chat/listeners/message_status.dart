import 'package:fixnum/fixnum.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats/message_status.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class MessageStatusListener {
  final NatsProvider natsProvider;
  final ChatFunctions chatFunctions;
  MessageStatusListener(
      {required this.natsProvider, required this.chatFunctions});

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider.natsListener;

  ChannelFunctions get channelFunctions =>
      UseMessageProvider.messageProvider.channelFunctions;
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
      ChatMessageStatusFields fields =
          ChatMessageStatusFields.fromMap(mapPayload.fields);
      if (fields.senderId != JwtPayload.myId) {
        List<MessageTable> messages = fields.messages;
        messagesToRead(messages, chatFunctions);
        await UseMessageProvider.messageProvider.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  static Future<void> messagesToRead(
      List<MessageTable> messages, ChatFunctions chatFunctions) async {
    for (final message in messages) {
      await chatFunctions.updateMessageStatus(message, MessageStatus.READ);
    }
  }
}
