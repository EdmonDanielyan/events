import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
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

@injectable
class TextSender with Loggable {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatFunctions chatFunctions;
  final ChatDatabase db;
  final ChannelsRegistry registry;

  TextSender(this.natsProvider, this.userFunctions, this.chatFunctions, this.db,
      this.registry);

  /// Publicise message to chat
  Future<bool> sendMessage(ChatTable chat, MessageTable message) async {
    bool success = await _sendTxtMessage(chat, message);
    MessageStatus status = success ? MessageStatus.SENT : MessageStatus.ERROR;
    await chatFunctions.updateMessageStatus(message, status);
    return success;
  }

  Future<bool> _sendTxtMessage(
    ChatTable chat,
    MessageTable message, {
    UserTable? user,
  }) async {
    var channelById = natsProvider.getGroupTextChannelById(chat.id);
    return await natsProvider.sendSystemMessageToChannel(
      channelById,
      MessageType.Text,
      ChatMessageFields(
        channel: channelById,
        chat: chat,
        message: message,
        user: user ?? userFunctions.me,
      ).toMap(),
    );
  }

  Future<void> redeliverMessages({int? userId}) async {
    logger.finest('redeliverMessages: $userId');

    final unsentMessages =
        await db.getUnsentMessages(userId ?? JwtPayload.myId);

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
          logger.fine(
              'SENDING MESSAGE ${chats[message.chatId]!.name} AND MESSAGE ${message.message}');
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
    logger.finest('sendTextingMessage: $channel');
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
