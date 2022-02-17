import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/listeners/channels_registry.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/models/chat/nats/message.dart';
import 'package:ink_mobile/messenger/models/chat/nats/texting.dart';
import 'package:ink_mobile/messenger/models/texting.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:moor/moor.dart';

import '../cases/chat_functions.dart';
import '../cases/user_functions.dart';

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

    logger.finest(() => '''
      SUCCESSFULLY SENT MESSAGE: $success
      MESSAGE: $message
      CHAT: $chat
    ''');

    if (!success) {
      await chatFunctions.updateMessageStatus(message, MessageSentStatus.ERROR);
    }

    return success;
  }

  Future<bool> _sendTxtMessage(
    ChatTable chat,
    MessageTable message, {
    UserTable? user,
  }) async {
    final ping = await natsProvider.ping();
    return ping &&
        await natsProvider.sendSystemMessageToChannel(
          chat.channel,
          MessageType.Text,
          ChatMessageFields(
            channel: chat.channel,
            chat: chat,
            message: message,
            user: user ?? userFunctions.me,
          ).toMap(),
        );
  }

  Future<void> redeliverMessages(
      {int? userId, bool onlyErrorMessages = false}) async {
    userId = userId ?? JwtPayload.myId;
    logger.finest(() => 'redeliverMessages: $userId');

    final unsentMessages = onlyErrorMessages
        ? await db.getErrorMessages(userId, orderingMode: OrderingMode.asc)
        : await db.getUnsentMessages(userId, orderingMode: OrderingMode.asc);

    Map<String, ChatTable> chats = {};

    if (unsentMessages.isNotEmpty) {
      for (final message in unsentMessages) {
        logger.finest(() => '''
        REDELEVIRING MESSAGE: $message
        ''');

        if (!chats.containsKey(message.chatId)) {
          final chat = await db.selectChatById(message.chatId);

          if (chat != null) {
            chats[message.chatId] = chat;
          }
        }

        if (chats.containsKey(message.chatId)) {
          logger.fine(() =>
              'SENDING TO CHAT ${chats[message.chatId]!.name} - ${message.message}');

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
    logger.finest(() => 'sendTextingMessage: $channel');
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
