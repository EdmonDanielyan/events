import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats/message.dart';
import 'package:ink_mobile/models/chat/nats/texting.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../chat_functions.dart';
import '../user_functions.dart';
import 'chat_saver.dart';

@injectable
class TextSender {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatFunctions chatFunctions;
  final ChatDatabase db;
  final ChannelsRegistry registry;

  final ChatSaver chatSaver;


  TextSender(this.natsProvider, this.userFunctions, this.chatFunctions, this.db,
      this.registry, this.chatSaver);

  Future<bool> sendTextMessage(String channel, ChatTable chat,
      MessageTable message, UserTable user) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.Text,
      ChatMessageFields(
        channel: channel,
        chat: chat,
        message: message,
        user: user,
      ).toMap(),
    );
  }

  Future<void> sendMessage(ChatTable chat, MessageTable message) async {
    bool success = await sendTxtMessage(chat, message);
    MessageStatus status = success ? MessageStatus.SENT : MessageStatus.ERROR;
    await chatFunctions.updateMessageStatus(message, status);

    chatSaver.saveChats(newChat: null);
  }

  Future<bool> sendTxtMessage(
      ChatTable chat,
      MessageTable message, {
        UserTable? user,
      }) async {
    return await sendTextMessage(
      natsProvider.getGroupTextChannelById(chat.id),
      chat,
      message,
      user ?? userFunctions.me,
    );
  }

  Future<void> redeliverMessages({int? userId}) async {
    final unsentMessages = await db.getUnsentMessages(userId ?? JwtPayload.myId);

    Map<String, ChatTable> chats = {};

    if (unsentMessages.isNotEmpty) {
      for (final message in unsentMessages) {
        if (!chats.containsKey(message.chatId)) {
          final chat = await db.selectChatById(message.chatId);

          if (chat != null) {
            chats[message.chatId] = chat;
          }
        }

        if (chats.containsKey(message.chatId)) {
          print(
              "SENDING MESSAGE ${chats[message.chatId]!.name} AND MESSAGE ${message.message}");
          await sendMessage(chats[message.chatId]!, message);
        }
      }
    }
  }

  Future<bool> sendTextingMessage(
      String channel, {
        required CustomTexting customTexting,
        required String chatId,
      }) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.Texting,
      ChatTextingFields(
        texting: customTexting,
        chatId: chatId,
      ).toMap(),
    );
  }
}