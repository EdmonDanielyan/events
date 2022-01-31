import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/cases/send_message.dart';
import 'package:ink_mobile/messenger/listeners/message_listener.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/database/tables/db_enum.dart';
import 'package:ink_mobile/messenger/models/chat/nats/invitation.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/sender/chat_saver.dart';
import 'package:ink_mobile/messenger/sender/invite_sender.dart';

import '../cases/user_functions.dart';
import 'channels_registry.dart';

@Named("UserJoined")
@Injectable(as: MessageListener)
class ChatJoinedListener extends MessageListener {
  final ChatFunctions chatFunctions;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatSaver chatSaver;
  final InviteSender messageSender;

  ChatJoinedListener(
      NatsProvider natsProvider,
      ChannelsRegistry registry,
      this.userFunctions,
      this.chatDatabaseCubit,
      this.messageSender,
      this.chatSaver,
      this.chatFunctions)
      : super(natsProvider, registry);

  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
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
        registry.joinedChats.add(chat);
        await userFunctions.insertMultipleUsers(users);
        await userFunctions.insertMultipleParticipants(
            ChatUserViewModel.toParticipants(users, chat));
        await setMessage(users, chat, message);
        await chatSaver.saveChats(newChat: null);
      }
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> setMessage(
      List<UserTable> users, ChatTable chat, NatsMessage message) async {
    for (final user in users) {
      final generateMessage = GetIt.I<SendMessage>().joinedLeftMessage(
        chatId: chat.id,
        userName: user.name,
        type: StoredMessageType.USER_JOINED,
        timestampUtc: message.timestamp,
        userId: user.id,
        sequence: message.sequence.toInt()
      );

      if (generateMessage != null) {
        await GetIt.I<SendMessage>()
            .addMessage(chat, generateMessage, setChatToFirst: true);
      }
    }
  }
}
