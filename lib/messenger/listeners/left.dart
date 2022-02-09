import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/cases/send_message.dart';
import 'package:ink_mobile/messenger/listeners/message_listener.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/schema/db_enum.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/left_joined.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/sender/chat_saver.dart';
import 'package:ink_mobile/messenger/sender/invite_sender.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';

import '../cases/user_functions.dart';
import 'channels_registry.dart';

@Named("UserLeftChat")
@Injectable(as: MessageListener)
class ChatLeftListener extends MessageListener {
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatSaver chatSaver;
  final InviteSender messageSender;

  final ChatFunctions chatFunctions;

  ChatLeftListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.messageSender,
    this.chatSaver,
    this.userFunctions,
    this.chatDatabaseCubit,
    this.chatFunctions,
  ) : super(natsProvider, registry);

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!isListeningToChannel(channel)) {
      return;
    }

    try {
      final mapPayload = message.payload! as JsonPayload;
      LeftJoinedPayload payload = LeftJoinedPayload.fromJson(mapPayload.json);

      final users =
          payload.users.map<UserTable>((e) => e.toUserTable()).toList();

      final chatId = payload.chatId;
      final senderId = message.from;
      var chat = await chatDatabaseCubit.db.selectChatById(chatId);

      if (users.isNotEmpty && chat != null) {
        if (chat.isGroup()) {
          await setMessage(users, chat, message);
        }
        final me = await _deleteIfItsMe(users, chat, senderId);

        if (!me) {
          final participants = ChatUserViewModel.toParticipants(users, chat);

          await userFunctions.deleteParticipants(participants, chat);
        }

        await chatSaver.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<bool> _deleteIfItsMe(
    List<UserTable> users,
    ChatTable chat,
    String senderId,
  ) async {
    for (final user in users) {
      if (user.id == JwtPayload.myId) {
        bool delete = true;

        if (senderId == JwtPayload.myId.toString()) {
          delete = false;
        } else {
          await Future.delayed(Duration(seconds: 2));
        }

        var countLefts = await chatDatabaseCubit.db.countMessagesByTypeChatUser(
            chat.id, user.id, StoredMessageType.USER_LEFT);
        var countJoins = await chatDatabaseCubit.db.countMessagesByTypeChatUser(
            chat.id, user.id, StoredMessageType.USER_JOINED);

        if (countLefts < countJoins) {
          delete = false;
        }

        if (delete) {
          chatFunctions.deleteAllChatMessages(chat.id);
          chatFunctions.deleteChat(chat.id);
          registry.unSubscribeOnChatDelete(chat.id);
          final selectedChat = chatDatabaseCubit.selectedChat;

          if (selectedChat != null && selectedChat.id == chat.id) {
            chatDatabaseCubit.setDeletedChat(true);
          }
        }

        return true;
      }
    }
    return false;
  }

  Future<void> setMessage(
      List<UserTable> users, ChatTable chat, NatsMessage message) async {
    for (final user in users) {
      final generateMessage = GetIt.I<SendMessage>().joinedLeftMessage(
          chatId: chat.id,
          userName: user.name,
          type: StoredMessageType.USER_LEFT,
          timestampUtc: message.timestamp,
          userId: user.id,
          sequence: message.sequence.toInt());

      if (generateMessage != null) {
        await GetIt.I<SendMessage>().addMessage(chat, generateMessage);
      }
    }
  }
}
