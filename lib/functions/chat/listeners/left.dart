import 'package:fixnum/fixnum.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../send_message.dart';
import '../user_functions.dart';
import 'channels_registry.dart';

@Named("UserLeftChat")
@Injectable(as: ChannelListener)
class ChatLeftListener extends ChannelListener {
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  ChatLeftListener({
    required this.messageProvider,
    required this.natsProvider,
    required this.userFunctions,
    required this.chatDatabaseCubit,
  });

  ChatLeftListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.messageSender,
    this.chatSaver,
    this.userFunctions,
    this.chatDatabaseCubit,
  ) : super(natsProvider, registry);

  Future<void> onMessage(String channel, NatsMessage message) async {
    if (!registry.isListening(channel)) {
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
        await UseMessageProvider.messageProvider?.chatSaver
            .saveChats(newChat: null);
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
        unsubscribeOnChatDelete(chat.id);
        final selectedChat = chatDatabaseCubit.selectedChat;

        if (selectedChat != null &&
            selectedChat.id == chat.id &&
            App.getContext != null) {
          Navigator.of(App.getContext!).popUntil((route) => route.isFirst);
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
            .addMessage(generateMessage);
      }
    }
  }
}
