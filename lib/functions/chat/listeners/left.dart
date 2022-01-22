import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/sender/chat_saver.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/leftJoined.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../send_message.dart';
import '../user_functions.dart';
import 'channel_listener.dart';
import 'channels_registry.dart';

@Named("UserLeftChat")
@Injectable(as: ChannelListener)
class ChatLeftListener extends ChannelListener {
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
      final mapPayload = message.payload! as SystemPayload;
      ChatLeftJoinedFields fields =
          ChatLeftJoinedFields.fromMap(mapPayload.fields);

      final users = fields.users;
      final chat = fields.chat;
      final senderId = fields.senderId;

      if (users.isNotEmpty) {
        final me = await _deleteIfItsMe(users, chat,
            countLefts: fields.countLefts, senderId: senderId);

        if (!me) {
          final participants = ChatUserViewModel.toParticipants(users, chat);

          await userFunctions.deleteParticipants(participants, chat);
          setMessage(users, chat, message);
        }

        await chatSaver.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<bool> _deleteIfItsMe(
    List<UserTable> users,
    ChatTable chat, {
    int? countLefts,
    required int senderId,
  }) async {
    for (final user in users) {
      if (user.id == JwtPayload.myId) {
        bool delete = true;

        if (senderId == JwtPayload.myId) {
          delete = false;
        } else {
          await Future.delayed(Duration(seconds: 2));
        }

        final iJoinedList = registry.joinedChats
            .where((element) => element.id == chat.id)
            .toList();

        if (countLefts != null && countLefts < iJoinedList.length) {
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
        type: MessageType.UserLeftChat,
        created: message.serverTime,
        userId: user.id,
      );

      if (generateMessage != null) {
        await GetIt.I<SendMessage>()
            .addMessage(chat, generateMessage, setChatToFirst: true);
      }
    }
  }
}
