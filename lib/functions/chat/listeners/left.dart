import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/sender/chat_saver.dart';
import 'package:ink_mobile/functions/chat/sender/invite_sender.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
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
      ChatInvitationFields fields =
          ChatInvitationFields.fromMap(mapPayload.fields);

      final users = fields.users;
      final chat = fields.chat;

      if (users.isNotEmpty) {
        final me = await _deleteIfItsMe(users, chat);
        if (!me) {
          final participants = ChatUserViewModel.toParticipants(users, chat);

          await userFunctions.deleteParticipants(participants, chat);
          setMessage(users, chat);
        }
        await chatSaver.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<bool> _deleteIfItsMe(List<UserTable> users, ChatTable chat) async {
    for (final user in users) {
      if (user.id == JwtPayload.myId) {
        chatFunctions.deleteAllChatMessages(chat.id);
        chatFunctions.deleteChat(chat.id);
        registry.unSubscribeOnChatDelete(chat.id);
        final selectedChat = chatDatabaseCubit.selectedChat;

        if (selectedChat != null && selectedChat.id == chat.id) {
          chatDatabaseCubit.setSelectedChat(null);
        }
        return true;
      }
    }
    return false;
  }

  Future<void> setMessage(List<UserTable> users, ChatTable chat) async {
    for (final user in users) {
      final generateMessage = SendMessage.joinedLeftMessage(
        chatId: chat.id,
        userName: user.name,
        type: MessageType.UserLeftChat,
      );

      if (generateMessage != null) {
        await SendMessage(chatDatabaseCubit: chatDatabaseCubit, chat: chat)
            .addMessage(generateMessage, setChatToFirst: false);
      }
    }
  }
}
